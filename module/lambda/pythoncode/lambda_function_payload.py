import boto3
import io
from PIL import Image  # Pillow should be added as a Lambda layer

# Initialize S3 client
s3 = boto3.client('s3')

# Target width for resizing
TARGET_WIDTH = 900

# Output S3 bucket name
DESTINATION_BUCKET = "output-s-v1"

def lambda_handler(event, context):
    try:
        # Extract bucket name and image key from the event
        source_bucket = event['Records'][0]['s3']['bucket']['name']
        image_key = event['Records'][0]['s3']['object']['key']
        
        print(f"Processing image: {image_key} from bucket: {source_bucket}")

        # Get the image from S3
        response = s3.get_object(Bucket=source_bucket, Key=image_key)
        image_data = response['Body'].read()

        # Open the image using Pillow
        image = Image.open(io.BytesIO(image_data))

        # Maintain aspect ratio while resizing to target width
        width_percent = TARGET_WIDTH / float(image.size[0])
        new_height = int(float(image.size[1]) * width_percent)

        # Resize image
        resized_image = image.resize((TARGET_WIDTH, new_height), Image.ANTIALIAS)

        # Convert resized image to byte array
        img_byte_arr = io.BytesIO()
        resized_image.save(img_byte_arr, format=image.format)
        img_byte_arr = img_byte_arr.getvalue()

        # Upload the resized image to the destination bucket
        s3.put_object(
            Bucket=DESTINATION_BUCKET,
            Key=image_key,
            Body=img_byte_arr,
            ContentType=response['ContentType']
        )

        print(f"Resized image saved to: s3://{DESTINATION_BUCKET}/{image_key}")

        return {
            "statusCode": 200,
            "body": f"Image {image_key} resized and saved successfully to {DESTINATION_BUCKET}."
        }

    except Exception as e:
        print(f"Error processing image: {str(e)}")
        return {
            "statusCode": 500,
            "body": f"Error resizing image: {str(e)}"
        }

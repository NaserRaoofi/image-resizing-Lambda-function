# **Image Resizing AWS Lambda Function**


![lambda_resize](https://github.com/user-attachments/assets/b27fcf09-9253-4efe-891d-edeef110af6a)


## **Overview**
This AWS Lambda function automatically resizes images uploaded to an S3 bucket. It uses **Pillow (PIL)** for image processing and stores the resized images in a separate S3 bucket.

## **Features**
- **Automatic Image Resizing**: Resizes images to a predefined width while maintaining aspect ratio.
- **AWS S3 Integration**: Listens to S3 upload events and processes images automatically.
- **Optimized Processing**: Uses AWS Lambda layers for dependency management.
- **Scalable & Cost-Efficient**: Executes only when triggered, reducing costs.

## **Prerequisites**
- AWS Account
- IAM Role with S3 permissions
- Pillow Python package (added as a Lambda Layer)

## **AWS Lambda Setup**
### **1. Handler Configuration**
In the AWS Lambda function settings, set the **Handler** to:
```plaintext
Imageresizing.lambda_handler
```
The function entry point is the `lambda_handler` function inside the `Imageresizing.py` script.

### **2. S3 Bucket Configuration**
- **Source Bucket**: The bucket where original images are uploaded.
- **Destination Bucket**: The bucket where resized images will be stored.

Modify the `DESTINATION_BUCKET` variable in `Imageresizing.py` accordingly:
```python
DESTINATION_BUCKET = "output-s-v1"
```

### **3. Adding a Lambda Layer for Pillow**
Since AWS Lambda doesn’t include **Pillow** by default, you need to add a **Lambda Layer** for Pillow.

#### **Prebuilt AWS Lambda Layer for Pillow (Python 3.9)**
Use the following **ARN** (change the region if necessary):
```plaintext
arn:aws:lambda:<your-region>:770693421928:layer:Klayers-p39-pillow:1
```
#### **Steps to Add a Layer**
1. Go to your AWS Lambda function.
2. Scroll down to **Layers** → Click **Add a Layer**.
3. Choose **Specify an ARN** and paste the ARN above.
4. Click **Add**.

### **4. IAM Permissions**
Ensure your Lambda execution role has permissions to:
- Read from the **source S3 bucket**.
- Write to the **destination S3 bucket**.
- Use **AWS Lambda layers**.

Attach the following **IAM Policy**:
```json
{
    "Effect": "Allow",
    "Action": [
        "s3:GetObject",
        "s3:PutObject"
    ],
    "Resource": "arn:aws:s3:::your-source-bucket/*"
}
```

## **Deployment Instructions**
1. **Package the Lambda function**:
```bash
zip -r lambda_function_payload.zip Imageresizing.py
```
2. **Upload the ZIP to AWS Lambda**.
3. **Set the correct handler (`Imageresizing.lambda_handler`)**.
4. **Attach the Pillow Lambda Layer**.
5. **Test the function by uploading an image to the S3 source bucket**.

## **Testing the Function**
Upload an image to your **source S3 bucket**, then check your **destination S3 bucket** for the resized image.

## **Troubleshooting**
### **Common Errors & Fixes**
1. **"ModuleNotFoundError: No module named 'PIL'"**
   - Ensure the **Pillow layer is added** to your Lambda function.

2. **"Unable to import module 'lambda_function'"**
   - Verify that your ZIP file contains `Imageresizing.py` at the root level.
   - Check that the handler is set as `Imageresizing.lambda_handler`.

3. **S3 Permission Denied**
   - Check the **IAM Role permissions** to ensure Lambda can access the S3 buckets.

## **Conclusion**
This function automates image resizing on AWS, making it easy to process images dynamically. Ensure the correct **handler configuration, IAM permissions, and Lambda Layer for Pillow** to avoid errors.

🚀 **Ready to deploy!** Let me know if you need further improvements.

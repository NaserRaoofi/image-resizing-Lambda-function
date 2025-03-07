# **Image Resizing AWS Lambda Function**


![lambda_resize](https://github.com/user-attachments/assets/b27fcf09-9253-4efe-891d-edeef110af6a)


## **Overview**
This AWS Lambda function automatically resizes images uploaded to an S3 bucket. It uses **Pillow (PIL)** for image processing and stores the resized images in a separate S3 bucket.

## **Features**
- **Automatic Image Resizing**: Resizes images to a predefined width while maintaining aspect ratio.
- **AWS S3 Integration**: Listens to S3 upload events and processes images automatically.
- **Optimized Processing**: Uses AWS Lambda layers for dependency management.
- **Scalable & Cost-Efficient**: Executes only when triggered, reducing costs.


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
4. **Test the function by uploading an image to the S3 source bucket**.

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
   - 
4. ** Set the correct handler (`Imageresizing.lambda_handler`)

## **Conclusion**
This function automates image resizing on AWS, making it easy to process images dynamically. Ensure the correct **handler configuration, IAM permissions, and Lambda Layer for Pillow** to avoid errors.

🚀 **Ready to deploy!** Let me know if you need further improvements.

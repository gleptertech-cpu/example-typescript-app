# Bootstrap: Terraform state bucket

Run this **once, before** the main `terraform/` config, to create the S3 bucket its backend depends on.

```sh
cd terraform/bootstrap
terraform init
terraform apply
```

This config intentionally uses **local state**, not the bucket it creates — it can't depend on something that doesn't exist yet on a first run. Re-running this later (e.g. to adjust tags) is rare and low-risk; it isn't something the main app's deploy pipeline touches.

Once the bucket exists, `terraform/terraform.tf`'s `backend "s3"` block can find it, and the main config's `terraform init` will work.

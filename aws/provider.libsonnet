{
    new(
        #  (Optional) This is the AWS access key. It must be provided, but it can also be sourced from the AWS_ACCESS_KEY_ID environment variable, or via a shared credentials file if profile is specified.        
        access_key = null,
        # This is the AWS secret key. It must be provided, but it can also be sourced from the AWS_SECRET_ACCESS_KEY environment variable, or via a shared credentials file if profile is specified.
        secret_key=null,
        # (Required) This is the AWS region. It must be provided, but it can also be sourced from the AWS_DEFAULT_REGION environment variables, or via a shared credentials file if profile is specified.
        region=null,
        # (Optional) This is the AWS profile name as set in the shared credentials file.
        profile=null,
        # (Optional) This is the path to the shared credentials file. If this is not set and a profile is specified, ~/.aws/credentials will be used. 
        shared_credentials_file=null,
    ):: {
        local it = self,

        provider: [{
            aws: {
                [if access_key != null then 'access_key']: access_key,
                [if secret_key != null then 'secret_key']: secret_key,
                [if region != null then 'region']: region,    
                [if profile != null then 'profile']: profile,        
                [if shared_credentials_file != null then 'shared_credentials_file']: shared_credentials_file,                       
            }
        }],        

    },
}
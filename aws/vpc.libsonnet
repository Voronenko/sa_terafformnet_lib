{
    /**
     * Returns a new graph panel that can be added in a row.
     * It requires the graph panel plugin in grafana, which is built-in.
     *
     * @cidr_block - (Required) The CIDR block for the VPC.
     * @instance_tenancy - (Optional) A tenancy option for instances launched into the VPC
     * @enable_dns_support - (Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults true.
     * @enable_dns_hostnames - (Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.
     * @enable_classiclink - (Optional) A boolean flag to enable/disable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic. See the ClassicLink documentation for more information. Defaults false.
     * @enable_classiclink_dns_support - (Optional) A boolean flag to enable/disable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic.
     * @assign_generated_ipv6_cidr_block - (Optional) Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false.
     * @tags - (Optional) A mapping of tags to assign to the resource. 
     * @return A json that represents vpc            
     */         

    local primitives = import 'abstract.libsonnet',

    new(
       name = "default",
       cidr_block,
       instance_tenancy = null,
       enable_dns_support = true,
       enable_dns_hostnames = false,
       enable_classiclink = false,
       enable_classiclink_dns_support = null,
       assign_generated_ipv6_cidr_block = false,
       tags = {},        
    ):: primitives.Resource {
        local it = self,
        local _content = self.content,

## properties
        name:: name,
        cidr_block:: cidr_block,
        instance_tenancy:: instance_tenancy,
        enable_dns_support:: enable_dns_support,
        enable_dns_hostnames:: enable_dns_hostnames,
        enable_classiclink:: enable_classiclink,
        enable_classiclink_dns_support:: enable_classiclink_dns_support,
        assign_generated_ipv6_cidr_block:: assign_generated_ipv6_cidr_block,
        tags:: tags,
        
### methods
        addTag(name, value):: self {
            tags+: { [name]: value}
        },
        enableDnsHostnames():: self {
            enable_dns_hostnames: true 
        },

### overrides

        type: "aws_vpc",
        content: {
            cidr_block:  cidr_block,
            [if it.instance_tenancy != null then 'instance_tenancy']: it.instance_tenancy,
            [if it.enable_dns_support != true then 'enable_dns_support']: it.enable_dns_support,
            [if it.enable_dns_hostnames != false then 'enable_dns_hostnames']: it.enable_dns_hostnames,
            [if it.enable_classiclink != false then 'enable_classiclink']: it.enable_classiclink,        
            [if it.enable_classiclink_dns_support != null then 'enable_classiclink_dns_support']: it.enable_classiclink_dns_support,        
            [if it.assign_generated_ipv6_cidr_block != false then 'shared_credentials_file']: it.assign_generated_ipv6_cidr_block,
            tags: it.tags,                   
        },
    }
}
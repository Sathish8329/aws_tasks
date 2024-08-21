Elastic Load Balancing (ELB) in AWS is a service that automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, IP addresses, and Lambda functions. ELB helps ensure that your applications have high availability and can scale efficiently.

There are three types of Elastic Load Balancers in AWS:

Application Load Balancer (ALB):

Layer: Operates at Layer 7 (Application Layer).
Use Case: Best for HTTP and HTTPS traffic. It can make routing decisions based on content, such as the URL or headers.
Features:
Path-based and host-based routing.
WebSockets support.
SSL/TLS termination.
Integration with AWS services like AWS Web Application Firewall (WAF).
Network Load Balancer (NLB):

Layer: Operates at Layer 4 (Transport Layer).
Use Case: Best for handling TCP, UDP, and TLS traffic where extreme performance is required.
Features:
High performance, capable of handling millions of requests per second.
Static IP addresses.
Support for elastic IPs.
Less latency compared to ALB.
Gateway Load Balancer (GWLB):

Layer: Combines the capabilities of a transparent network gateway (Layer 3) and a load balancer.
Use Case: Ideal for deploying, scaling, and managing virtual appliances, such as firewalls, intrusion detection and prevention systems, and deep packet inspection systems.
Key Features of ELB:
Health Checks: ELB performs health checks on registered targets and only routes traffic to healthy targets.

Security: Integration with AWS Certificate Manager (ACM) for SSL/TLS certificates, and support for VPC security groups.

Auto Scaling: Works seamlessly with Auto Scaling to add or remove instances based on demand.

Cross-Zone Load Balancing: ELB can distribute traffic evenly across multiple availability zones within a region.

Sticky Sessions: Also known as session affinity, this feature allows ELB to bind a user’s session to a specific instance.

Logging and Monitoring: ELB integrates with CloudWatch to provide detailed metrics and access logs.

The Classic Load Balancer (CLB) is one of the older load balancing solutions in AWS, primarily used to distribute incoming application or network traffic across multiple EC2 instances. While it's still available, AWS recommends using the newer Application Load Balancer (ALB) or Network Load Balancer (NLB) for most use cases due to their enhanced features and better performance.

Key Features of Classic Load Balancer (CLB):
Layer 4 and Layer 7 Load Balancing:

CLB operates at both Layer 4 (Transport Layer) and Layer 7 (Application Layer) of the OSI model.
It can handle both TCP and HTTP/HTTPS traffic.
Simple Configuration:

CLB offers a straightforward setup, making it easy to deploy and manage for basic load balancing needs.
It's ideal for simple web applications where advanced routing is not required.


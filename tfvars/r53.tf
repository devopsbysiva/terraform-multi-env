resource "aws_route53_record" "expense" {
    for_each = aws_instance.expense
    zone_id = var.zone_id
    name = each.key == "frontend_prod" ? "${domain_name}" : "${each.key}.${domain_name}"
    type = "A"
    ttl = 1
    records = startswith( $each.key, "frontend") ? [each.value.public.ip] : [each.value.private.ip]
    allow_overwrite = true
}
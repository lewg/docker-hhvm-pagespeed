HHVM + Nginx/Pagespeed
======================

Runs [HHVM](http://hhvm.com/) behind [Nginx](http://nginx.org/) built with the [Pagespeed module](https://developers.google.com/speed/pagespeed/module/) with [supervisor](http://supervisord.org/).

Info
----

To do something useful you'll want to use this as a base and copy files into`/srv/www` or mount a volume there!

Notes
-----

I've added some logic to the `default.conf` to use the[`ngx_http_realip_module`](http://nginx.org/en/docs/http/ngx_http_realip_module.html) module and to relay the proxied HTTPS status to HHVM. If you want to make this more restrictive, you can adjust the `set_real_ip_from` lines or remove the`fastcgi_param HTTPS` line as needed. By default, nginx is setup to use the X-Forwarded-For header if the request comes from any of the standard private ip ranges (10.x.x.x, 192.168.x.x, 172.16.0.0 - 172.31.255.255). Additionally the HHVM admin server is passed through on port 8080, but not exposed outside of the container (if you do, do so carefully!)

Key Software Versions
---------------------

-	Nginx: 1.9.11
-	HHVM: 3.12.1

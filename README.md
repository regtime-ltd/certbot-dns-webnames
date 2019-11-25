# certbot-dns-webnames
DNS API for certbot --manual-auth-hook --manual-cleanup-hook

Install and renew Let's encrypt wildcard ssl certificate for domain *.site.com using Webnames.ru:

#### 1) Clone this repo and set the API key
```bash
git clone https://github.com/regtime-ltd/certbot-dns-webnames/ && cd ./certbot-dns-webnames
```

#### 2) Set API KEY

Get your Webnames.ru API key in zone manage domain.

```bash
nano ./config.sh
```

#### 3) Install CertBot from git
```bash
cd ../ && git clone https://github.com/certbot/certbot && cd certbot
```

#### 4) Generate wildcard
```bash
./letsencrypt-auto certonly --manual-public-ip-logging-ok --agree-tos --email info@site.com --renew-by-default -d site.com -d *.site.com --manual --manual-auth-hook ../certbot-dns-webnames/authenticator.sh --manual-cleanup-hook ../certbot-dns-webnames
/cleanup.sh --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```

#### 5) Force Renew
```bash
./letsencrypt-auto renew --force-renew --manual --manual-auth-hook ../certbot-dns-webnames/authenticator.sh --manual-cleanup-hook ../certbot-dns-webnames/cleanup.sh --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```

#### 5) Howto API key
API KEY можно найти в разделе "Личный кабинет" / "Мои домены и услуги" / "Управление доменом"(по интересующему домену) / "Управление зоной"(домен должен быть делегирован на DNS регистратора ns1.nameself.com; ns2.nameself.com) / "Настройка Certbot для домена ..." (внизу страницы)

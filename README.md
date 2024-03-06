# koyeb-rcindex
Deploy Rclone Index to koyeb with Dark Theme.

## Environment variables

1. `CONFIG_URL` (mandatory, select one)

Raw rclone config URL. You can use https://gist.github.com, create a secret gist, paste your rclone.conf content, save it, and copy the raw URL of that gist.

2. `USERNAME` (Optional)

Username for authentication (leave blank for no auth). It must be paired with `PASSWORD` variable if you want to add authentication.

3. `PASSWORD` (Optional)

Password for authentication (leave blank for no auth). It must be paired with `USERNAME` variable if you want to add authentication.

### Deploy
[![Deploy to Koyeb](https://www.koyeb.com/static/images/deploy/button.svg)](https://app.koyeb.com/deploy?type=git&repository=github.com/asemwwb086/koyeb-rcindex&branch=main&name=koyeb-rcindex)

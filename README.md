# Docker coming-soon Generator

Serves a "comming soon" page for you filled with content from your environment variables.

I took the [bootstrap4 comming soon](https://github.com/BlackrockDigital/startbootstrap-coming-soon) template as default
and wrote a docker deploy script with twig template compiler where you can pick and run a page within minutes.

Here is an example of the result:

![bootstrap4-example](https://raw.githubusercontent.com/roest01/docker-coming-soon-generator/master/templates/bootstrap4/example.png)

# Usage
Please set environment variable `TEMPLATE` to pick one of these avaliable templates.
If you don't pick a template, `bootstrap4` is default

| Template | Preview | Description |
| -------- | ------- | ------- |
| bootstrap4 | <img src="https://raw.githubusercontent.com/roest01/docker-coming-soon-generator/master/templates/bootstrap4/example.png" width="250"> |  | 
| blank | | output variables one by one |

You have the following environment variables which allow you to configure the
coming soon page:



| Variable name | Description                            | used in Templates | Example                                                                |
|-----------------|------------------------------------------- | -------------------- | ---------------------------------------------------------------------------------|
| TITLE         | Webpage head title and heading              | bootstrap4, blank | Coming Soon!                                                   |
| SUBLINE       | The sentence under the title                | bootstrap4, blank | We're working hard to finish the development of this site. Our target launch date is &lt;strong&gt;January 2019&lt;/strong&gt;!                |
| MAIN_COLOR  | Main color to be used in template      | bootstrap4, blank | #6c757d                     |
| VIDEO_URL  | Internal or external URL to the background video      | bootstrap4, blank | mp4/bg.mp4                     |
| BACKGROUND_IMAGE  | Image to use as body background     | bootstrap4, blank | none                    |
| FACEBOOK_URL  | Facebook URL to your page      | bootstrap4, blank | https://www.facebook.com/yourPage                     |
| TWITTER_URL   | Twitter URL to your page       | bootstrap4, blank | https://www.twitter.com/yourPage                       |
| GITHUB_URL    | Github URL to your page        | bootstrap4, blank | https://www.github.com/yourPage                         |
HTML is allowed !

## what happen at Build ?
1. Checkout missing templates with `checkout.sh` script into `templates`
2. move template (name stored in env) `TEMPLATE` to root
3. remove templates folder with unused templates
4. write config file from env if file missing
5. compile `index.html.twig` into `index.html` with config.json as variables


## FAQ

##### How to change Video in `bootstrap4` template?
Important: only mp4 possible ! Many ways to rome:

1. mount volume into `/usr/share/nginx/html/mp4` and put `bg.mp4` into folder.
2. enter external link to any mp4 video into `VIDEO_URL` env`


## Contributing

If you're able to add more templates or optimise anything you're welcome.
New templates? Just check out or add them into `templates` folder, create `index.html.twig` file
and keep records of used environment variables in `README.md


## kudos
by the way there is another comming soon for docker
[zedtux/docker-coming-soon](https://github.com/zedtux/docker-coming-soon) - may this is working better for you?
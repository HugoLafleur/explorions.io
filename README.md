blog-gohugo.io
==============

<p>This is where I'll keep track of the the blog site's progression</p>

### Notes of all kinds
1. Create Volume Container
:	docker create -v /blog/content --name blogcontent alpine /bin/true

2. Create Image from Dockerfile
:	docker build -t blog -f Dockerfile .

3. Run Container
:	docker run -P -d --name blog --volumes-from blogcontent blog:latest
:	Also see runBlog.sh

4. Access Docker Machine (when IP changes)
:	aws ec2 authorize-security-group-egress --group-id [sg-id] --cidr $(publicip)/32 --protocol tcp --port 0-65535

Other Notes
:	The CMD instruction doesn't support variables, needed to create a symbolic link to the theme

To Start
:	./runBlog.sh [docker-machine-name] [container-name] [bind-port]

### Workflow

1. Prepare Docker machine
2. Create Volume Container to persist blog content (e.g. blogcontent)
3. Clone Git repository
4. Build Docker image
5. Launch Docker container using "runBlog.sh"
```bash
 $runBlog.sh         default              blog                80
|----CMD----| |--docker machine--| |--Container Name--| |--bind port--|
```
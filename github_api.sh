
# gist
curl https://api.github.com/gists/public \
-H "Authorization: token <my_token>"
# user
curl -i https://api.github.com/user \
-H "Authorization: token <my_token>"
# repos
curl "https://api.github.com/user/repos?type=owner" \
-H "Authorization: token <my_token>" \
-X GET -G 

# list of deploy_keys
curl -i "https://api.github.com/users/goldver/keys" \
-H "Authorization: token <my_token>" \
-X GET -G 
###################################

# create repository [works in postman, not works in cmd]
curl -i "https://api.github.com/user/repos" \ 
-H "Authorization: token <my_token>" \
-H "Content-Type: application/json" \
-X POST \
-d @<(cat <<EOF
	{ 
	    "name": "misha_test", 
	    "auto_init": true, 
	    "private": false, 
	    "gitignore_template": "nanoc" 
	} 
EOF
)  

# create key to account
curl -i "https://api.github.com/user/keys" \
-H "Authorization: token <my_token>" \
-H "Content-Type: application/json" \
-X POST \
-d @<(cat <<EOF
	{ 
	  "title": "deploy_key", 
	  "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO.... goldver@gmail.com" 
	}
EOF
) 

# create key to repo
curl -i "https://api.github.com/repos/goldver/bash_scripts/keys" \
-H "Authorization: token <my_token>" \
-H "Content-Type: application/json" \
-X POST \
-d @<(cat <<EOF
	{ 
	  "title": "deploy_key", 
	  "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO.... goldver@gmail.com" 
	}
EOF
) 












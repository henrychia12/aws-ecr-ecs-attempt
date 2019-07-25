[
    {
        "essential": true,
	"memory": 256,
	"name": "myapp",
	"cpu" : 256,
	"image": "${REPOSITORY_URL}:ui",
	"workingDirectory": "/app",
	"command": ["ng", "build"],
	"portMappings": [
	    {
		"containerPort": 4200,
		"hostPort" : 4200
	    }
	]
    }
]	

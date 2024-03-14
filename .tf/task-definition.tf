resource "aws_ecs_task_definition" "task_definition" {
  family                   = "task-definition"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "my-container"
      image     = "ECR_IMAGE_URL"
      cpu       = 128
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}


variable "database_url" {
  type    = string
  default = getenv("DATABASE_URL")
}

env "local" {
  src = "file://schema"
  url = getenv("DATABASE_URL")
  dev = "docker://postgres/16/dev?search_path=public"

  migration {
    dir = "file://migrations"
  }
}

env "ci" {
  src = "file://schema"
  dev = "docker://postgres/16/dev?search_path=public"

  migration {
    dir = "file://migrations"
  }
}

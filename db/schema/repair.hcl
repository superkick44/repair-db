schema "public" {}

table "repairs" {
  schema = schema.public

  column "id" {
    type = serial
  }
  column "user_id" {
    type = integer
    null = false
  }
  column "item" {
    type = text
    null = false
  }
  column "status" {
    type = text
    null = false
  }
  column "created_at" {
    type    = timestamptz
    default = sql("now()")
  }

  primary_key {
    columns = [column.id]
  }

  foreign_key "repairs_user_id_fkey" {
    columns     = [column.user_id]
    ref_columns = [table.users.column.id]
    on_delete   = CASCADE
  }
}

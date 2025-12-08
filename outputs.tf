output "project" {
  description = "An object that allows referencing to the Automation Project created by name or id"
  value = {
    "name" = vra_project.this.name,
    "id"   = vra_project.this.id
  }
}

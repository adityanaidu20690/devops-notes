create a pipeline azure devops pipeline for the below structure
my-project/
  ├── aditya-project/
  │    ├── azure-pipelines.yml  # Pipeline is inside this folder
  │    ├── pom.xml             # Maven POM file for aditya-project
  │    ├── src/                # Source code for aditya-project
  │    └── other-files/        # Any other files for aditya-project
  ├── project-2/
  │    ├── azure-pipelines.yml  # Pipeline is inside this folder
  │    ├── pom.xml             # Maven POM file for project-2
  │    ├── src/                # Source code for project-2
  │    └── other-files/        # Any other files for project-2
  ├── project-3/
  │    ├── azure-pipelines.yml  # Pipeline is inside this folder
  │    ├── pom.xml             # Maven POM file for project-3
  │    ├── src/                # Source code for project-3
  │    └── other-files/        # Any other files for project-3
  └── other-folders/            # Other folders or files not related to the pipeline

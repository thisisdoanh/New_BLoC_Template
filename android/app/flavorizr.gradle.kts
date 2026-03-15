import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.template.bloc.managermant.dev"
            resValue(type = "string", name = "app_name", value = "Dev: Template Bloc")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.template.bloc.managermant"
            resValue(type = "string", name = "app_name", value = "Template Bloc")
        }
    }
}
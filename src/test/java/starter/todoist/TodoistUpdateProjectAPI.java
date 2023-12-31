package starter.todoist;
import io.restassured.http.ContentType;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;

import starter.utils.Constants;

import java.io.File;

public class TodoistUpdateProjectAPI {

    public static String UPDATE_PROJECT = Constants.BASE_URL+"/projects/{project_id}";

    @Step("Update project")
    public void updateProject(String project_id, File json){
        SerenityRest.given().headers("Authorization", "Bearer " + Constants.TOKEN_KEI)
                .pathParam("project_id", project_id)
                .contentType(ContentType.JSON)
                .body(json);
    }
}

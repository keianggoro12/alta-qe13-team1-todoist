package starter.todoist;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.restassured.module.jsv.JsonSchemaValidator;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;

public class TodoistGetAllCollabAPI {

    public static String GET_ALL_COLLABORATORS= Constants.BASE_URL+"/projects/{project_id}/collaborators";

    @Step("Get all collaborators")
    public void setGetSingleProject(String project_id){
        SerenityRest.given().headers("Authorization", "Bearer " + Constants.TOKEN_KEI)
                .pathParam("project_id", project_id);
    }

}

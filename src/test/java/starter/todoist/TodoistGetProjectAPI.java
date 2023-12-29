package starter.todoist;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.restassured.module.jsv.JsonSchemaValidator;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;
public class TodoistGetProjectAPI {

    public static String GET_ALL_PROJECT = Constants.BASE_URL+"/projects/";
    public static String GET_SINGLE_PROJECT = Constants.BASE_URL+"/projects/{project_id}";

    @Step("Get all project")
    public void setGetAllProject(){
        SerenityRest.given();
    }
    @Step("Get single project")
    public void setGetSingleProject(int project_id){
        SerenityRest.given()
                .pathParam("project_id", project_id);
    }

}

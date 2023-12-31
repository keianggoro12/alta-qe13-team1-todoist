package starter.todoist;

import io.restassured.http.ContentType;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;

import java.io.File;

public class TodoistPostProjectAPI {

    public static String POST_PROJECT = Constants.BASE_URL+"/projects/";

    @Step("Post project")
    public void postProject(File json){
        SerenityRest.given().headers("Authorization", "Bearer " + Constants.TOKEN_KEI)
        .contentType(ContentType.JSON).body(json);
    }
}

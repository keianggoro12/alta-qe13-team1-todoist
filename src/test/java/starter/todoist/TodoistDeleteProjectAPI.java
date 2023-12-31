package starter.todoist;

import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;

public class TodoistDeleteProjectAPI {

    public static String DELETE_PROJECT = Constants.BASE_URL+"/projects/{project_id}";

    @Step("Delete Project")
    public void deleteProject (String project_id){
                SerenityRest.given().headers("Authorization", "Bearer " + Constants.TOKEN_KEI)
                        .pathParam("project_id",project_id);
    }

}

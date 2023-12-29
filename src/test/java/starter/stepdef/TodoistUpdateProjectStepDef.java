package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.module.jsv.JsonSchemaValidator;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistPostProjectAPI;
import starter.todoist.TodoistResponses;
import starter.todoist.TodoistUpdateProjectAPI;
import starter.utils.Constants;

import java.io.File;

import static net.serenitybdd.rest.SerenityRest.then;
import static org.hamcrest.Matchers.equalTo;

public class TodoistUpdateProjectStepDef {

    @Steps
    TodoistUpdateProjectAPI todoistUpdateProjectAPI;
    @Given("Update single project with {string} and {string}")
    public void updateSingleProjectWith(String project_id, String json) {
        File jsonUpdateUser = new File(Constants.REQ_BODY+json);
        todoistUpdateProjectAPI .updateProject(project_id,jsonUpdateUser);
    }

    @When("Send request update project")
    public void sendRequestUpdateProject() {
        SerenityRest.when().post(TodoistUpdateProjectAPI.UPDATE_PROJECT);
    }

    @And("Validate update project json schema {string}")
    public void validateUpdateProjectJsonSchema(String json) {
        File jsonProject = new File(Constants.JSON_SCHEMA+json);
        SerenityRest.and().assertThat().body(JsonSchemaValidator.matchesJsonSchema(jsonProject));
    }
    @And("Response body return color was {string}")
    public void responseBodyReturnColorWas(String color) {
        SerenityRest.and()
                .body(TodoistResponses.COLOR, equalTo(color));
    }
    @And("Response body return view style was {string}")
    public void responseBodyReturnViewStyleWas(String view_style) {
        SerenityRest.and()
                .body(TodoistResponses.VIEW_STYLE, equalTo(view_style));
    }

    @And("Response body return is favorite was {string}")
    public void responseBodyReturnIsFavoriteWas(String isFavorite) {
        boolean expectedIsFavorite = Boolean.parseBoolean(isFavorite);
        then()
                .body(TodoistResponses.IS_FAVORITE, equalTo(expectedIsFavorite));
    }
}

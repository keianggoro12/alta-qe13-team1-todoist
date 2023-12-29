package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistGetProjectAPI;
import starter.todoist.TodoistResponses;
import starter.utils.Constants;
import io.restassured.module.jsv.JsonSchemaValidator;
import java.io.File;
import static org.hamcrest.Matchers.equalTo;

public class TodoistGetProjectStepDef {

    @Steps
    TodoistGetProjectAPI todoistGetProjectAPI;

    @Given("Get all project")
    public void getAllProject() {todoistGetProjectAPI.setGetAllProject();
    }

    @When("Send request get all project")
    public void sendRequestGetProject() {
        SerenityRest.given()
                .header("Authorization", "Bearer " + Constants.TOKEN_KEI)
                .when().get(TodoistGetProjectAPI.GET_ALL_PROJECT);
    }

    @Then("Status code should be {int}")
    public void statusCodeShouldBe(int statusCode) {
        SerenityRest.then()
                .statusCode(statusCode);
    }

    @And("Validate get project json schema {string}")
    public void validateGetProjectJsonSchema(String json) {
        File jsonProject = new File(Constants.JSON_SCHEMA+json);
        SerenityRest.and().assertThat().body(JsonSchemaValidator.matchesJsonSchema(jsonProject));
    }
}

package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.module.jsv.JsonSchemaValidator;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistPostProjectAPI;
import starter.todoist.TodoistResponses;
import starter.utils.Constants;

import java.io.File;

import static net.serenitybdd.rest.SerenityRest.then;
import static org.hamcrest.Matchers.equalTo;

public class TodoistPostProjectStepDef {

    @Steps
    TodoistPostProjectAPI todoistPostProjectAPI;

    @Given("Create single project with {string}")
    public void createSingleProjectWith(String json) {
        File jsonPostProject = new File(Constants.REQ_BODY+json);
        todoistPostProjectAPI.postProject(jsonPostProject);
    }

    @When("Send request post project")
    public void sendRequestPostProject() {
        SerenityRest.when().post(TodoistPostProjectAPI.POST_PROJECT);
    }

    @And("Response body return name was {string}")
    public void responseBodyReturnNameWas(String name) {
        SerenityRest.and()
                .body(TodoistResponses.NAME, equalTo(name));
    }

    @And("Response body return name was {string} and color was {string}")
    public void responseBodyReturnNameWas(String name, String color) {
        SerenityRest.and()
                .body(TodoistResponses.NAME, equalTo(name))
                .body(TodoistResponses.COLOR, equalTo(color));
    }

    @And("Validate post project json schema {string}")
    public void validatePostProjectJsonSchema(String json) {
        File jsonProject = new File(Constants.JSON_SCHEMA+json);
        SerenityRest.and().assertThat().body(JsonSchemaValidator.matchesJsonSchema(jsonProject));
    }

    @And("Response body return name was {string} and is favorite is {string}")
    public void responseBodyReturnNameWasAndIsFavoriteIs(String name, String isFavorite) {
        boolean expectedIsFavorite = Boolean.parseBoolean(isFavorite);
        then()
                .body(TodoistResponses.NAME, equalTo(name))
                .body(TodoistResponses.IS_FAVORITE, equalTo(expectedIsFavorite));
    }

    @And("Response body return name was {string} and view style was {string}")
    public void responseBodyReturnNameWasAndViewStyleWas(String name, String view_style) {
        SerenityRest.and()
                .body(TodoistResponses.NAME, equalTo(name))
                .body(TodoistResponses.VIEW_STYLE, equalTo(view_style));
    }

    @And("Response body return name was {string} is favorite was {string} color was {string} and view style was {string}")
    public void responseBodyReturnNameWasIsFavoriteWasColorWasAndViewStyleWas(String name, String isFavorite, String color, String view_style) {
        boolean expectedIsFavorite = Boolean.parseBoolean(isFavorite);
        then()
                .body(TodoistResponses.NAME, equalTo(name))
                .body(TodoistResponses.IS_FAVORITE, equalTo(expectedIsFavorite))
                .body(TodoistResponses.COLOR, equalTo(color))
                .body(TodoistResponses.VIEW_STYLE, equalTo(view_style));
    }
}

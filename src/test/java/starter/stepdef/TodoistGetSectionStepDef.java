package starter.stepdef;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistGetSectionAPI;

public class TodoistGetSectionStepDef {

    @Steps
    TodoistGetSectionAPI todoistGetSectionAPI;
    @Given("Get section with {string}")
    public void getSectionWith(String project_id) {
        todoistGetSectionAPI.setGetSection(project_id);
    }

    @When("Send request get section")
    public void sendRequestGetSection() {
        SerenityRest.when().get(TodoistGetSectionAPI.GET_SECTION);
    }
    @When("Send request this section")
    public void sendRequestGetSection2() {
        SerenityRest.when().get(TodoistGetSectionAPI.GET_SECTION2);
    }
}

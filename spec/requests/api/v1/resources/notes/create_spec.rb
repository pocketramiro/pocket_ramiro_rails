RSpec.describe "as a registered user", type: :request do
  describe "when I visit a resource's page" do
    before :each do
      Note.destroy_all
      Resource.destroy_all
      ResourceType.destroy_all
      User.destroy_all
      @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
      @r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
      @resource1 = @r_type1.resources.create(name: "Bright Tank 1", cost:20000.00, user_id: 1, created_at: "2008-02-09 16:49:29", updated_at: "2008-02-09 16:49:29", active: true,id: 1)
    end

    it "I can create a new note for that resource" do
      new_note = {id: 3,
                   user_id: 1,
                   table_key: 1,
                   table_name: "Resources",
                   content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                   created_at: "2019-07-05 20:35:50",
                   updated_at: "2019-07-10 20:35:50"}


      post "/api/v1/resources/1/notes", params: new_note

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      note = Note.last

      expect(results[:id]).to eq(3)
      expect(results[:user_id]).to eq(1)
      expect(results[:table_key]).to eq(1)
      expect(results[:table_name]).to eq("Resources")
    end

    it "does not allow me to create a note without a user or resource" do
      new_note = {id: 3,
                   table_key: 1,
                   table_name: "Resources",
                   content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                   created_at: "2019-07-05 20:35:50",
                   updated_at: "2019-07-10 20:35:50"}


      post "/api/v1/resources/1/notes", params: new_note

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      note = Note.last

      expect(note).to eq(nil)
      expect(results).to eq({
        "Error": "Note could not be created."
        })
    end
  end
end

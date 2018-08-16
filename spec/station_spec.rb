require "station"

describe Station do
  # As per walkthrough commented out below
  # subject {described_class.new(name: "Old Street", zone: 1)}
  # it 'knows its name' do
  #   expect(subject.name).to eq("Old Street")
  # end
  #
  # it 'knows its zone' do                                                     
  #   expect(subject.zone).to eq(1)
  # end

  it "initializes with name and zone" do
    st = Station.new("AE", 1)
    expect([st.name, st.zone]).to eq ["AE", 1]

  end
end

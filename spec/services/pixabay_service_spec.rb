require 'rails_helper'

describe PixabayService do
  context 'instance methods' do
    context '#city_image' do
      it "Returns image options" do
        location = "denver,co"
        service = PixabayService.new
        images = service.city_image(location)

        expect(images.keys).to match_array([:total, :totalHits, :hits])
        expect(images[:hits][0].class).to eq Hash
      end
    end
  end
end

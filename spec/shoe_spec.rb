require "spec_helper"

  describe(Shoe) do
    it { should have_and_belong_to_many(:stores) }

    it("validates presence of a shoe brand") do
      new_shoe = Shoe.new({:brand => ""})
      expect(new_shoe.save()).to(eq(false))
    end

    it("capitalizes entry when saved") do
      new_shoe = Shoe.create({:brand => "adidas"})
      expect(new_shoe.brand()).to(eq("Adidas"))
    end
  end

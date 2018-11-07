require_relative 'gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end

    context "+5 Dexterity Vest" do
      it "decreases sell_in count and quality by 1" do
        items = [Item.new("+5 Dexterity Vest", 20, 37)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 36
      end
    end

    context "Aged Brie" do
      it "decreases sell_in count and increases quality by 1" do
        items = [Item.new("Aged Brie", 32, 42)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 31
        expect(items[0].quality).to eq 43
      end
    end

    context "Elixir of the Mongoose" do
      it "decreases sell_in count and quality by 1" do
        items = [Item.new("Elixir of the Mongoose", 3, 9)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 2
        expect(items[0].quality).to eq 8
      end
    end

    context "Sulfuras, Hand of Ragnaros" do
      it "does not change sell_in count or quality" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 27, 80)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 27
        expect(items[0].quality).to eq 80
      end
    end

    context "Backstage passes to a TAFKAL80ETC concert" do
      it "decreases sell_in count and increases quality by 1" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 42)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 14
        expect(items[0].quality).to eq 43
      end
    end

    context "Conjured Mana Cake" do
      it "decreases sell_in count and quality by 1" do
        items = [Item.new("Conjured Mana Cake", 3, 6)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 2
        expect(items[0].quality).to eq 5
      end
    end
  end
end

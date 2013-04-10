require_relative 'spec_helper'

describe JsonPatch do
  describe "#generate" do
    it "generate empty patch if nothing has changed" do
      JsonPatch.generate({}, {}).should == []
    end

    context "add op" do
      it "on hash member" do
        JsonPatch.generate({foo: :bar}, {foo: :bar, baz: :qux}).should == [{ op: :add, path: "/baz", value: :qux }]
      end

      it "on array element" do
        JsonPatch.generate({foo: [:bar, :baz]}, {foo: [:bar, :qux, :baz]}).should == [{ op: :add, path: "/foo/1", value: :qux }]
      end

      it "on nested member object" do
        JsonPatch.generate({foo: :bar}, {foo: :bar, child: {grandchild: {}}}).should == [{ op: :add, path: "/child", value: {grandchild: {}} }]
      end
    end

    context "remove op" do
      it "on hash member" do
        JsonPatch.generate({foo: :bar, baz: :qux}, {foo: :bar}).should == [{ op: :remove, path: "/baz"}]
      end

      it "on array element" do
        JsonPatch.generate({foo: [:bar, :qux, :baz]}, {foo: [:bar, :baz]}).should == [{ op: :remove, path: "/foo/1" }]
      end
    end

    context "replace op" do
      it "on hash member" do
        JsonPatch.generate({foo: :bar, baz: :qux}, {foo: :bar, baz: :boo}).should == [{ op: :replace, path: "/baz", value: :boo}]
      end

      it "on array element" do
        JsonPatch.generate({foo: [:bar, :qux, :baz]}, {foo: [:bar, :foo, :baz]}).should == [{ op: :replace, path: "/foo/1", value: :foo }]
      end
    end
  end
end

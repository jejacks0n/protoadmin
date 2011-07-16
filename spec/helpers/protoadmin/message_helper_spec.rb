require 'spec_helper'

describe Protoadmin::MessageHelper do

  describe '#flash_messages' do

    it "builds an html structure from flash messages" do
      helper.flash.success = 'success'
      helper.flash.notice = 'notice'
      helper.flash.alert = 'alert'
      helper.flash.error = 'error'

      expected_html = <<-HTML
        <div id=\"flash_messages\">
          <div class=\"notice flash-message\">success</div>
          <div class=\"notice flash-message\">notice</div>
          <div class=\"notice flash-message\">alert</div>
          <div class=\"notice flash-message\">error</div>
        </div>
        HTML

      helper.flash_messages.should == expected_html.gsub(/^\s+|\n/, '')
    end

  end

end
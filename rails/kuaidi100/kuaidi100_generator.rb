module Rails
  class Kuaidi100Generator < Rails::Generators::NamedBase
    def create_controller_file
      route "post '#{file_name}/show'"
      route "get '#{file_name}/index'"
      create_file "app/controllers/#{file_name}_controller.rb", <<-FILE
  class #{class_name}Controller < ApplicationController

      def index
      end

      def show

        url = URI.parse('http://api.kuaidi100.com/api')

        Net::HTTP.start(url.host, url.port) do |http|

        req = Net::HTTP::Post.new(url.path)

        req.set_form_data({
          id: "",
          com: params[:com],
          nu: params[:nu],
          valicode:"",
          show:"2",
          muti:"1",
          order:"desc"
        })

        puts http.request(req).body

        @content = http.request(req).body.force_encoding("UTF-8")

        end
      end
  end
      FILE
    end

    def create_view_file
      create_file "app/views/#{file_name}/index.html.haml", <<-FILE
  =form_tag #{file_name}_show_path,role:"form" do |f|
    .form-group
      %label 快递单号:
      =text_field_tag :nu
    .form-group
      .col-md-3
        =select_tag 'com', options_for_select(get_com_hash.collect{ |ch| [ ch[1], ch[0] ] }), class:"form-control"
    .form-group
      =submit_tag "自助查询", class: "btn btn-success"
      FILE

      create_file "app/views/#{file_name}/show.html.haml", <<-FILE
  %hr
  :javascript
      document.write("#{'#{@content}'}");
      FILE
    end

    def create_helper_file
      create_file "app/helpers/#{file_name}_helper.rb", <<-FILE
  module #{class_name}Helper
    def get_com_hash
      @com_hash ={
          "tiantian"=>"天天",
          "shentong"=>"申通",
          "yuantong"=>"圆通",
          "shunfeng"=>"顺丰",
          "debangwuliu"=>"德邦",
          "yunda"=>"韵达"
          }
    end
  end
      FILE
    end
  end
end

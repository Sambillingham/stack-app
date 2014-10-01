ActiveAdmin.register Story do
  permit_params :title, :body, :url, :is_featured
end

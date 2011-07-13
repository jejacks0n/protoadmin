Rails.application.config.to_prepare do
  Protoadmin::Config.setup do |config|

    # To add navigation items you can create new groups, or add to existing groups.  You can add any number of items to
    # a given group.  This is a small wrapper for the [Navigasmic Gem](https://github.com/jejacks0n/navigasmic), and you
    # can read more about it there.
    #
    # You can do more complex things with the navigation.  For instance, permissions clearly plays a role in admin
    # interfaces, so if you didn't want a group or item to be shown to some users, you could use:
    #
    #   :hidden_unless => proc { can?(:manage, :something) } # using cancan as an example
    #
    # Some other options are:
    #
    #   :highlights_on => a path or {:controller => 'controller', :action => 'index'}, or a proc that returns one
    #   :disabled_if => a proc that returns true or false
    #
    config.add_navigation do |n|
      n.group 'Content' do
        n.item 'Add New Article', :link => '#', :class => 'articles-new'
        n.item 'View Articles',   :link => '#', :class => 'articles-index'
        n.item 'Categories',      :link => '#', :class => 'categories-index'
        n.item 'Tags',            :link => '#', :class => 'tags-index'
      end
      n.group 'Users' do
        n.item 'Add New User',    :link => '#', :class => 'users-new'
        n.item 'View Users',      :link => '#', :class => 'users-index'
        n.item 'Your Account',    :link => '#', :class => 'my-account'
      end
      n.group 'Media' do
        n.item 'File Manager',    :link => '#'
        n.item 'Gallery',         :link => '#'
        n.item 'Audio',           :link => '#'
        n.item 'Video',           :link => '#'
      end
      n.group 'Admin' do
        n.item 'Options',         :link => '#'
        n.item 'Security',        :link => '#'
        n.item 'Logout',          :link => '#'
      end
    end

  end
end

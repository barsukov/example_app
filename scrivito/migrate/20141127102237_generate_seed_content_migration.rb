class GenerateSeedContentMigration < ::Scrivito::Migration
  def up
    homepage = update_homepage

    history_blog = create_history_blog
    create_founding_page(history_blog)
    create_berlin_wall_page(history_blog)
    create_reunification_page(history_blog)

    capital_city_page = create_capital_city_page

    homepage.update(child_order: [capital_city_page, history_blog])
  end

  private

  def random_path_component
    SecureRandom.hex(16)
  end

  def create_image(file_name)
    file = File.new(Rails.root.join('lib/seed_data/', file_name))

    Image.create(blob: file)
  end

  def update_homepage
    homepage = Homepage.find_by_path('/')

    brandenburg_img = create_image('brandenburg_gate.jpg')

    siegessaeule_img = create_image('siegessaeule.jpg')


    inner_columns = TwoColumnWidget.new(
      column1_width: 6,
      column1_content: [TextWidget.new(text: texts['berlin_introduction'])],
      column2_content: [ImageWidget.new(image: siegessaeule_img)]
    )

    outer_columns = TwoColumnWidget.new(
      column1_width: 8,
      column1_content: [
        HeadlineWidget.new(headline: 'Berlin'),
        inner_columns
      ],
      column2_content: [
        HeadlineWidget.new(headline: 'Content'),
        TextWidget.new(text: texts['content_disclaimer'])
      ]
    )

    homepage.update(
      title: 'Berlin',
      body: [
        ImageWidget.new(image: brandenburg_img),
        outer_columns
      ]
    )

    homepage
  end

  def create_history_blog
    Blog.create(
      _path: "/#{random_path_component}",
      title: 'History Blog'
    )
  end

  def create_founding_page(blog)
    old_map_img = create_image('old_map.jpg')

    main_columns = TwoColumnWidget.new(
      column1_width: 8,
      column1_content: [
        HeadlineWidget.new(headline: 'Emerging city (1200-1400)'),
        TextWidget.new(text: texts['founding'])
      ],
      column2_content: [ImageWidget.new(image: old_map_img)]
    )

    BlogPost.create(
      _path: "#{blog.path}/#{random_path_component}",
      title: 'The Founding of Berlin',
      published_at: Date.new(1237, 1, 1),
      author_name: 'wikipedia',
      body: [main_columns]
    )
  end

  def create_berlin_wall_page(blog)
    berlin_wall_img = create_image('berlin_wall.jpg')

    main_columns = TwoColumnWidget.new(
      column1_width: 4,
      column1_content: [ImageWidget.new(image: berlin_wall_img)],
      column2_content: [
        TextWidget.new(text: texts['berlin_wall1']),
        TextWidget.new(text: texts['berlin_wall2'])
      ]
    )

    BlogPost.create(
      _path: "#{blog.path}/#{random_path_component}",
      title: 'Construction of the Berlin Wall',
      published_at: Date.new(1961, 8, 13),
      author_name: 'wikipedia',
      body: [main_columns]
    )
  end

  def create_reunification_page(blog)
    reunification_img = create_image('reunification.jpg')

    main_columns = TwoColumnWidget.new(
      column1_width: 8,
      column1_content: [
        HeadlineWidget.new(headline: 'The Fall of the Berlin Wall'),
        TextWidget.new(text: texts['reunification'])
      ],
      column2_content: [ImageWidget.new(image: reunification_img)]
    )

    BlogPost.create(
      _path: "#{blog.path}/#{random_path_component}",
      title: 'Reunification of Berlin',
      published_at: Date.new(1989, 11, 9),
      author_name: 'wikipedia',
      body: [main_columns]
    )
  end

  def create_capital_city_page
    reichstag_img = create_image('reichstag.jpg')

    main_columns = TwoColumnWidget.new(
      column1_width: 5,
      column1_content: [
        HeadlineWidget.new(headline: 'Capital of Germany'),
        TextWidget.new(text: texts['capital_city'])
      ],
      column2_content: [ImageWidget.new(image: reichstag_img)]
    )

    Page.create(
      _path: "/#{random_path_component}",
      title: 'Capital City',
      body: [main_columns]
    )
  end

  def texts
    @texts ||= YAML.load_file(Rails.root.join('lib/seed_data/texts.yml'))
  end
end

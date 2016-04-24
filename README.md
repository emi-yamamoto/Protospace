# DB DSEIGN
## Users
### Associations
    has_many [tweets, comments, likes]

### Column
- id :integer
- name :string
- email :string [devise]
- password :string [devise]
- member :string
- profile :text
- works :string
- image :string [CarrierWave]

## Prototypes
### Associations
    belongs_to :user
    has_many [comments, images, likes]

### Column
- id :integer
- title :string
- catch_copy :string
- concept :text
- user_id :integer

## Comments
### Associations
    belongs _to [prototype, user]

### Column
- id :integer
- text :text
- user_id :integer
- prototype_id :integer

## Images
### Associations
    belongs_to :prototype

### Column
- id :integer
- status :integer [CarrierWave]
- prototype_id :integer

## Likes
### Associations
    belongs_to :prototype

### Column
- id :integer
- user_id :integer
- prototype_id :integer


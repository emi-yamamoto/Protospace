# DB DSEIGN
## Users
### Asosiations
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
### Asosiations
    belongs_to :user
    has_many [comments, images, likes]

### Column
- id :integer
- title :string
- catch_copy :string
- concept :text
- user_id :integer
- likes_count :integer

## Comments
### Asosiations
    belongs _to [prototype, user]

### Column
- id :integer
- text :text
- user_id :integer
- prototype_id :integer

## Images
### Asosiations
    belongs_to :prototype

### Column
- id :integer
- status :string [CarrierWave]
- prototype_id :integer

## Likes
### Asosiations
    belongs_to :prototype

### Column
- id :integer
- user_id :integer
- prototype_id :integer


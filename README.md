# DB DSEIGN
## Users
### Asosiations
    has_many [tweets, comments]

### Column
- id :integer
- name :string
- email :string
- password :string
- member :string
- profile :text
- works :string
- image :string

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
- status :string
- prototype_id :integer

## Likes
### Asosiations
    belongs_to :prototype

### Column
- id :integer
- user_id :integer
- prototype_id :integer


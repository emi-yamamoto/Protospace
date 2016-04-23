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
- profile :string
- works :string

## Prototypes
### Asosiations
    belongs _to :user
    has_many [comments, images]

### Column
- id :integer
- title :string
- catch_copy :string
- concept :text
- user_id :integer

## comments
### Asosiations
    belongs _to [prototype, user]

### Column
- id :integer
- text :text
- user_id :integer
- prototype_id :integer

## Images
### Asosiations
    belongs _to :prototype

### Column
- id :integer
- name :string
- prototype_id :integer


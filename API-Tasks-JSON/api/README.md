## API Tasks - JSON Server

###

A simulation `API` using `JSON server` in less than **5 minutes**

###

```powershell
npm install -g json-server
```

###
```powershell
npx json-server --watch api/db.json --port 3000
```

---

###
```json
{
    "tarefas": [
        {
            "id": 1,
            "name": "Your task"
        },
        {
            "id": 2,
            "name": "Your task"
        },
        {
            "id": 3,
            "name": "Your task"
        }
    ]
}
```
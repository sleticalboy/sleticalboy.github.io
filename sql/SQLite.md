# SQLite
---
## 数据类型
- text
- integer
- blob

---
## 多表联查
```sql
SELECT * FROM emoji_list INNER JOIN emoji_group_list ON emoji_list.pack_uuid=emoji_group_list.uuid WHERE emoji_group_list.type=1 AND emoji_list.current_user_id=15909 ORDER BY id DESC
SELECT emoji_group_list.uuid FROM emoji_group_list WHERE type=1
SELECT * FROM emoji_list WHERE pack_uuid='15886c3d-d0af-4050-aaaa-e5755a539eb1-1'
SELECT * FROM emoji_list INNER JOIN emoji_group_list ON emoji_list.pack_uuid=emoji_group_list.uuid WHERE emoji_group_list.type=1 AND emoji_list.current_user_id=15909 ORDER BY id DESC
SELECT * FROM emoji_group_list
```
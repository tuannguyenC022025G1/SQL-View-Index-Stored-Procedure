"# SQL-View-Index-Stored-Procedure" 
I.SQL - Using Views:

🎯Khái niệm:
View (hay còn gọi là khung nhìn) là một bảng ảo được tạo ra từ một hoặc nhiều bảng thật trong cơ sở dữ liệu. View không lưu trữ dữ liệu thật, mà chỉ lưu câu truy vấn SQL để tạo ra dữ liệu mỗi khi bạn truy cập view.

🎯Cấu trúc:
CREATE VIEW ten_view AS
SELECT ... FROM ... WHERE ...;

🎯 Mục đích của View:
+----+-------------------+------------+-------+--------------------------------------------------------+
| Mục đích 			|   Giải thích          					       | 
+----+-------------------+------------+-------+--------------------------------------------------------+
| 🔒 Bảo mật dữ liệu: 		|   Giấu các cột hoặc bảng không cần thiết với người dùng.  	       | 
| 📦 Đơn giản hóa truy vấn: 	|Gom nhiều bảng hoặc điều kiện phức tạp thành 1 view để truy vấn dễ hơn|
| 🔄 Tái sử dụng truy vấn:	|Dùng lại logic phức tạp trong nhiều truy vấn khác nhau.	       |
| 🔍 Lọc dữ liệu:		| Tạo ra các tập con dữ liệu theo điều kiện cụ thể.		       | 
+----+-------------------+------------+-------+--------------------------------------------------------+

🎯 Lưu ý:
+----------------------------------+----------------------------------------------------------------------------+
|	Điều kiện			View có thể làm gì?							|
|View đơn giản (1 bảng):		Có thể SELECT, đôi khi INSERT, UPDATE, DELETE.				|
|---------------------------------------------------------------------------------------------------------------|
|View phức tạp (JOIN, GROUP BY):	Chỉ SELECT được, không thể sửa đổi dữ liệu.View không lưu dữ liệu thật: |
|					Mỗi lần truy vấn, nó chạy lại câu lệnh SELECT.				|
+----------------------------------+----------------------------------------------------------------------------+
🎯 Cập nhật view
 
✅ Nếu view đó là updatable, thì bạn có thể chèn, cập nhật hoặc xóa dữ liệu thông qua view, và các thay đổi sẽ ảnh hưởng đến bảng gốc (base table).

❌Nếu view là phức tạp (dùng JOIN, GROUP BY, DISTINCT, v.v...), thì không thể chèn dữ liệu qua view. Nếu bạn thử, hệ quản trị cơ sở dữ liệu (DBMS) sẽ báo lỗi.

📌Một view có thể được cập nhật trong các điều kiện nhất định được đưa ra dưới đây:

Mệnh đề SELECT có thể không chứa từ khóa DISTINCT.

Mệnh đề SELECT có thể không chứa các hàm summary.

Mệnh đề SELECT có thể không chứa các hàm tập hợp.

Mệnh đề SELECT có thể không chứa các toán tử tập hợp.

Mệnh đề SELECT có thể không chứa mệnh đề ORDER BY.

Mệnh đề FROM có thể không chứa nhiều bảng.

Mệnh đề WHERE có thể không chứa các truy vấn con.

Truy vấn có thể không chứa GROUP BY hoặc HAVING.

Các cột được tính toán có thể không được cập nhật.

Tất cả các cột KHÔNG NULL từ bảng cơ sở phải được đưa vào view để truy vấn INSERT hoạt động.

✅ Chèn hàng vào view (INSERT INTO)
⚠️ Chỉ thực hiện được nếu view là updatable view (view có thể ghi).

INSERT INTO ten_view (cot1, cot2, ...)
VALUES (giatri1, giatri2, ...);

🗑️ Xóa hàng khỏi view (DELETE)
⚠️ Chỉ thực hiện được nếu view có thể cập nhật và không chứa các ràng buộc phức tạp.

DELETE FROM ten_view
WHERE dieu_kien;

❌Xóa view khỏi cơ sở dữ liệu (DROP VIEW)

DROP VIEW ten_view;

✅WITH CHECK OPTION:

WITH CHECK OPTION là tùy chọn với câu lệnh CREATE VIEW. Mục đích của WITH CHECK OPTION là để đảm bảo rằng tất cả các UPDATE và INSERT đều đáp ứng (các) điều kiện trong định nghĩa view.

Nếu chúng không thỏa mãn (các) điều kiện, thì UPDATE hoặc INSERT trả về lỗi.
ví dụ:
CREATE VIEW CUSTOMERS_VIEW AS
SELECT name, age
FROM  CUSTOMERS
WHERE age IS NOT NULL
WITH CHECK OPTION;



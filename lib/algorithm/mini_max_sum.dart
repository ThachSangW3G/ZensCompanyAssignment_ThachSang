List<int> miniMaxSum(List<int> arr) {
  // Kiểm tra ràng buộc: danh sách phải có đúng 5 phần tử
  if (arr.length != 5) {
    throw ArgumentError("Mảng truyền vào phải có đúng 5 phần tử");
  }

  // Sắp xếp danh sách theo thứ tự tăng dần
  arr.sort();

  // Tính tổng tối thiểu bằng cách loại trừ phần tử lớn nhất
  int minSum =
      arr.sublist(0, arr.length - 1).reduce((sum, element) => sum + element);

  // Tính tổng tối đa bằng cách loại trừ phần tử nhỏ nhất
  int maxSum = arr.sublist(1).reduce((sum, element) => sum + element);

  return [minSum, maxSum];
}

void main() {
  // Ví dụ sử dụng
  List<int> arr = [4, 6, 2, 9, 4, 4];
  try {
    List<int> result = miniMaxSum(arr);
    print(result[0]); // In ra tổng tối thiểu
    print(result[1]); // In ra tổng tối đa
  } on ArgumentError catch (error) {
    print(error.message); // In ra thông báo lỗi
  }
}

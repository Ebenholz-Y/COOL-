#!/bin/bash

# COOL Stack Implementation - Run Script
# Author: [Your Name]
# Date: $(date +%Y-%m-%d)

echo "=== COOL Stack Implementation Runner ==="
echo "开始时间: $(date)"
echo ""

# 检查必要的命令
check_command() {
    if command -v $1 >/dev/null 2>&1; then
        echo "✓ $1 找到: $(which $1)"
        return 0
    else
        echo "✗ $1 未找到"
        return 1
    fi
}

echo "1. 检查环境..."
check_command coolc
check_command spim
echo ""

# 编译函数
compile_file() {
    local file=$1
    echo "编译: $file"
    if coolc "$file"; then
        if [ -f "${file%.cl}.s" ]; then
            echo "✓ 编译成功: ${file%.cl}.s"
            return 0
        else
            echo "✗ 编译失败: 未生成 .s 文件"
            return 1
        fi
    else
        echo "✗ 编译失败"
        return 1
    fi
}

# 运行函数
run_file() {
    local file=$1
    echo "运行: $file"
    echo "--- 程序输出开始 ---"
    spim "$file"
    local exit_code=$?
    echo "--- 程序输出结束 ---"
    return $exit_code
}

echo "2. 编译栈实现..."
compile_file stack.cl
echo ""

echo "3. 运行主测试..."
if [ -f "stack.s" ]; then
    run_file stack.s
    MAIN_RESULT=$?
else
    echo "✗ 主程序未编译成功，跳过运行"
    MAIN_RESULT=1
fi
echo ""

echo "4. 编译额外测试..."
compile_file test_stack.cl
echo ""

echo "5. 运行额外测试..."
if [ -f "test_stack.s" ]; then
    run_file test_stack.s
    TEST_RESULT=$?
else
    echo "✗ 测试程序未编译成功，跳过运行"
    TEST_RESULT=1
fi
echo ""

echo "6. 生成运行报告..."
cat > run_report.txt << EOF
COOL Stack Implementation - 运行报告
生成时间: $(date)

环境检查:
- coolc: $(which coolc 2>/dev/null || echo "未找到")
- spim: $(which spim 2>/dev/null || echo "未找到")

编译结果:
- stack.cl: $(if [ -f "stack.s" ]; then echo "成功"; else echo "失败"; fi)
- test_stack.cl: $(if [ -f "test_stack.s" ]; then echo "成功"; else echo "失败"; fi)

运行结果:
- 主程序: $(if [ $MAIN_RESULT -eq 0 ]; then echo "成功"; else echo "失败"; fi)
- 测试程序: $(if [ $TEST_RESULT -eq 0 ]; then echo "成功"; else echo "失败"; fi)

文件列表:
$(ls -la *.cl *.s 2>/dev/null | head -10)

注: 此报告由 run_example.sh 自动生成
EOF

echo "✓ 运行报告已保存: run_report.txt"
echo ""

echo "=== 运行完成 ==="
echo "结束时间: $(date)"

# 显示报告摘要
echo ""
echo "=== 报告摘要 ==="
cat run_report.txt | grep -E "(成功|失败|时间:)"

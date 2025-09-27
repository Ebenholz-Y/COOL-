class TestStack inherits IO {
    -- 专门的测试类，包含更多测试用例
    
    test_basic_operations() : Bool {
        {
            out_string("Testing basic operations...\n");
            let s : Stack <- new Stack.init() in {
                s.push(1).push(2).push(3);
                if s.size() = 3 then
                    if s.pop() = 3 then
                        if s.pop() = 2 then
                            if s.pop() = 1 then
                                if s.is_empty() then
                                    {
                                        out_string("✓ Basic operations test passed\n");
                                        true;
                                    }
                                else false fi
                            else false fi
                        else false fi
                    else false fi
                else false fi
            };
        }
    };
    
    test_empty_stack() : Bool {
        {
            out_string("Testing empty stack behavior...\n");
            let s : Stack <- new Stack.init() in {
                if s.is_empty() then
                    if s.pop() = 0 then  -- Should return 0 for empty stack
                        {
                            out_string("✓ Empty stack test passed\n");
                            true;
                        }
                    else false fi
                else false fi
            };
        }
    };
};

class ComprehensiveTest inherits IO {
    main() : Object {
        {
            out_string("=== Comprehensive Stack Tests ===\n");
            
            let tester : TestStack <- new TestStack in {
                if tester.test_basic_operations() then
                    if tester.test_empty_stack() then
                        out_string("✓ All tests passed!\n")
                    else out_string("✗ Empty stack test failed\n") fi
                else out_string("✗ Basic operations test failed\n") fi
            };
            
            out_string("=== Test Suite Completed ===\n");
        }
    };
};

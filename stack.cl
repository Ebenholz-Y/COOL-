```cool
class StackNode inherits IO {
    data : Int;
    next : StackNode;
    
    init(value : Int, next_node : StackNode) : StackNode {
        {
            data <- value;
            next <- next_node;
            self;
        }
    };
    
    get_data() : Int { data };
    
    get_next() : StackNode { next };
};

class Stack inherits IO {
    top_node : StackNode;
    count : Int;
    
    init() : Stack {
        {
            top_node <- new StackNode;
            count <- 0;
            self;
        }
    };
    
    is_empty() : Bool {
        count = 0
    };
    
    size() : Int {
        count
    };
    
    push(item : Int) : Stack {
        {
            top_node <- new StackNode.init(item, top_node);
            count <- count + 1;
            out_string("Pushed: ").out_int(item).out_string("\n");
            self;
        }
    };
    
    pop() : Int {
        if is_empty() then
            {
                out_string("Error: Stack is empty\n");
                0;
            }
        else
            {
                let old_top : StackNode <- top_node,
                    value : Int <- old_top.get_data() in
                {
                    top_node <- old_top.get_next();
                    count <- count - 1;
                    out_string("Popped: ").out_int(value).out_string("\n");
                    value;
                };
            }
        fi
    };
    
    peek() : Int {
        if is_empty() then
            {
                out_string("Error: Stack is empty\n");
                0;
            }
        else
            top_node.get_data()
        fi
    };
    
    display() : Object {
        if is_empty() then
            out_string("Stack is empty\n")
        else
            {
                out_string("Stack contents (top to bottom): ");
                let current : StackNode <- top_node in
                    while not isvoid current loop
                    {
                        out_int(current.get_data()).out_string(" ");
                        current <- current.get_next();
                    }
                    pool;
                out_string("\n");
            }
        fi
    };
};

class Main inherits IO {
    main() : Object {
        {
            out_string("=== Stack Implementation Test ===\n\n");
            
            let stack : Stack <- new Stack.init() in {
                -- Test 1: Basic operations
                out_string("Test 1: Basic Operations\n");
                out_string("Initial stack size: ").out_int(stack.size()).out_string("\n");
                
                -- Push elements
                stack.push(10);
                stack.push(20);
                stack.push(30);
                stack.display();
                
                -- Peek at top element
                out_string("Top element: ").out_int(stack.peek()).out_string("\n");
                
                -- Pop element
                stack.pop();
                stack.display();
                out_string("Current stack size: ").out_int(stack.size()).out_string("\n\n");
                
                -- Test 2: Boundary conditions
                out_string("Test 2: Boundary Conditions\n");
                
                -- Test popping from empty stack
                let temp_stack : Stack <- new Stack.init() in {
                    out_string("Popping from empty stack: ");
                    temp_stack.pop();
                };
                
                -- Test continuous operations
                stack.push(40);
                stack.push(50);
                stack.push(60);
                stack.display();
                
                -- Pop all elements
                out_string("Popping all elements:\n");
                while not stack.is_empty() loop
                    stack.pop()
                pool;
                
                stack.display();
                out_string("\n");
                
                -- Test 3: Method chaining
                out_string("Test 3: Method Chaining\n");
                stack.push(100).push(200).push(300);
                stack.display();
                
                out_string("\n=== All Tests Completed Successfully ===\n");
            };
        }
    };
};

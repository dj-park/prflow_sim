rendering_page_dict = {8: "prj_rast1",
                       12: "rast2_i1",
                       16: "zculling_i1",
                       20: "coloringFB_i1",
                       22: "output_data"
                       }
num_cnt_read = 30
def counter_type_str(counter_type):
    if counter_type == 3:
        return "full"
    elif counter_type == 2:
        return "empty"
    elif counter_type == 1:
        return "read"
    else:
        return "stall"

with open("./rendering_prj/rendering_prj.sim/sim_1/behav/xsim/monitor.txt", "r") as infile:
    lines = infile.readlines()
    line_cnt = 0
    result_cnt = 0
    op_list = []
    for line in lines:
        time = int(line.split()[1].replace(",","").strip())
        cnt = line.split()[2]
        if line_cnt > 1: # ignore first two stamps
            cnt = cnt[15:] # remove padding
            cnt = cnt[1:] # remove valid bit
            dst_leaf = int(cnt[0:5],2)
            dst_port = int(cnt[5:9],2)
            self_leaf = int(cnt[9:14],2)
            self_port = int(cnt[14:18],2)
            counter_type = int(cnt[18:20],2)
            counter_val = int(cnt[20:],2)
            # print(cnt)
            # print(dst_leaf)
            # print(self_leaf)
            assert(dst_leaf == 1)
            assert(dst_port == 2)
            counter = counter_type_str(counter_type)
            op_name = rendering_page_dict[self_leaf]
            op_list += [(op_name + '-' + str(self_leaf), self_port, counter,counter_val)]
            # print(op_name + " " + str(self_port) + " " + str(counter) + " " + str(counter_val))
            result_cnt += 1
            if(result_cnt%(num_cnt_read) == 0):
                for elem in sorted(op_list):
                    print(*elem)
                op_list = []
                print()
        line_cnt += 1
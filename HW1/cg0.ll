; ModuleID = 'cg.c'
source_filename = "cg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@firstrow = internal global i32 0, align 4
@lastrow = internal global i32 0, align 4
@firstcol = internal global i32 0, align 4
@lastcol = internal global i32 0, align 4
@.str = private unnamed_addr constant [75 x i8] c"\0A\0A NAS Parallel Benchmarks 3.0 structured OpenMP C version - CG Benchmark\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c" Size: %10d\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c" Iterations: %5d\0A\00", align 1
@naa = internal global i32 0, align 4
@nzz = internal global i32 0, align 4
@tran = internal global double 0.000000e+00, align 8
@amult = internal global double 0.000000e+00, align 8
@a = internal global [2198001 x double] zeroinitializer, align 16
@colidx = internal global [2198001 x i32] zeroinitializer, align 16
@rowstr = internal global [14002 x i32] zeroinitializer, align 16
@arow = internal global [2198001 x i32] zeroinitializer, align 16
@acol = internal global [2198001 x i32] zeroinitializer, align 16
@aelt = internal global [2198001 x double] zeroinitializer, align 16
@v = internal global [14002 x double] zeroinitializer, align 16
@iv = internal global [28002 x i32] zeroinitializer, align 16
@x = internal global [14003 x double] zeroinitializer, align 16
@q = internal global [14003 x double] zeroinitializer, align 16
@z = internal global [14003 x double] zeroinitializer, align 16
@r = internal global [14003 x double] zeroinitializer, align 16
@p = internal global [14003 x double] zeroinitializer, align 16
@.str.3 = private unnamed_addr constant [51 x i8] c"   iteration           ||r||                 zeta\0A\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"    %5d       %20.14e%20.13e\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c" Benchmark completed\0A\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c" VERIFICATION SUCCESSFUL\0A\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c" Zeta is    %20.12e\0A\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c" Error is   %20.12e\0A\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c" VERIFICATION FAILED\0A\00", align 1
@.str.10 = private unnamed_addr constant [30 x i8] c" Zeta                %20.12e\0A\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c" The correct zeta is %20.12e\0A\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c" Problem size unknown\0A\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c" NO VERIFICATION PERFORMED\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"CG\00", align 1
@.str.15 = private unnamed_addr constant [25 x i8] c"          floating point\00", align 1
@.str.16 = private unnamed_addr constant [15 x i8] c"3.0 structured\00", align 1
@.str.17 = private unnamed_addr constant [12 x i8] c"25 Sep 2018\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"clang\00", align 1
@.str.19 = private unnamed_addr constant [4 x i8] c"-lm\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"-I../common\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"-O0 \00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"(none)\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"randdp\00", align 1
@conj_grad.callcount = internal global i32 0, align 4
@.str.24 = private unnamed_addr constant [45 x i8] c"Space for matrix elements exceeded in makea\0A\00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c"nnza, nzmax = %d, %d\0A\00", align 1
@.str.26 = private unnamed_addr constant [13 x i8] c"iouter = %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca i8, align 1
  %18 = alloca i32, align 4
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1, i32* %10, align 4
  store i32 1, i32* @firstrow, align 4
  store i32 14000, i32* @lastrow, align 4
  store i32 1, i32* @firstcol, align 4
  store i32 14000, i32* @lastcol, align 4
  store i8 65, i8* %17, align 1
  store double 0x4031215715A1D8EC, double* %19, align 8
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i32 0, i32 0))
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 14000)
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i32 15)
  store i32 14000, i32* @naa, align 4
  store i32 2198000, i32* @nzz, align 4
  store double 0x41B2B9B0A1000000, double* @tran, align 8
  store double 0x41D2309CE5400000, double* @amult, align 8
  %24 = load double, double* @amult, align 8
  %25 = call double @randlc(double* @tran, double %24)
  store double %25, double* %11, align 8
  %26 = load i32, i32* @naa, align 4
  %27 = load i32, i32* @nzz, align 4
  %28 = load i32, i32* @firstrow, align 4
  %29 = load i32, i32* @lastrow, align 4
  %30 = load i32, i32* @firstcol, align 4
  %31 = load i32, i32* @lastcol, align 4
  call void @makea(i32 %26, i32 %27, double* getelementptr inbounds ([2198001 x double], [2198001 x double]* @a, i32 0, i32 0), i32* getelementptr inbounds ([2198001 x i32], [2198001 x i32]* @colidx, i32 0, i32 0), i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i32 0, i32 0), i32 11, i32 %28, i32 %29, i32 %30, i32 %31, double 1.000000e-01, i32* getelementptr inbounds ([2198001 x i32], [2198001 x i32]* @arow, i32 0, i32 0), i32* getelementptr inbounds ([2198001 x i32], [2198001 x i32]* @acol, i32 0, i32 0), double* getelementptr inbounds ([2198001 x double], [2198001 x double]* @aelt, i32 0, i32 0), double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i32 0, i32 0), i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i32 0, i32 0), double 2.000000e+01)
  store i32 1, i32* %7, align 4
  br label %32

; <label>:32:                                     ; preds = %67, %2
  %33 = load i32, i32* %7, align 4
  %34 = load i32, i32* @lastrow, align 4
  %35 = load i32, i32* @firstrow, align 4
  %36 = sub nsw i32 %34, %35
  %37 = add nsw i32 %36, 1
  %38 = icmp sle i32 %33, %37
  br i1 %38, label %39, label %70

; <label>:39:                                     ; preds = %32
  %40 = load i32, i32* %7, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %8, align 4
  br label %44

; <label>:44:                                     ; preds = %63, %39
  %45 = load i32, i32* %8, align 4
  %46 = load i32, i32* %7, align 4
  %47 = add nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %48
  %50 = load i32, i32* %49, align 4
  %51 = icmp slt i32 %45, %50
  br i1 %51, label %52, label %66

; <label>:52:                                     ; preds = %44
  %53 = load i32, i32* %8, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = load i32, i32* @firstcol, align 4
  %58 = sub nsw i32 %56, %57
  %59 = add nsw i32 %58, 1
  %60 = load i32, i32* %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %61
  store i32 %59, i32* %62, align 4
  br label %63

; <label>:63:                                     ; preds = %52
  %64 = load i32, i32* %8, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %8, align 4
  br label %44

; <label>:66:                                     ; preds = %44
  br label %67

; <label>:67:                                     ; preds = %66
  %68 = load i32, i32* %7, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %7, align 4
  br label %32

; <label>:70:                                     ; preds = %32
  store i32 1, i32* %6, align 4
  br label %71

; <label>:71:                                     ; preds = %78, %70
  %72 = load i32, i32* %6, align 4
  %73 = icmp sle i32 %72, 14001
  br i1 %73, label %74, label %81

; <label>:74:                                     ; preds = %71
  %75 = load i32, i32* %6, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %76
  store double 1.000000e+00, double* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %74
  %79 = load i32, i32* %6, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %6, align 4
  br label %71

; <label>:81:                                     ; preds = %71
  store i32 1, i32* %7, align 4
  br label %82

; <label>:82:                                     ; preds = %102, %81
  %83 = load i32, i32* %7, align 4
  %84 = load i32, i32* @lastcol, align 4
  %85 = load i32, i32* @firstcol, align 4
  %86 = sub nsw i32 %84, %85
  %87 = add nsw i32 %86, 1
  %88 = icmp sle i32 %83, %87
  br i1 %88, label %89, label %105

; <label>:89:                                     ; preds = %82
  %90 = load i32, i32* %7, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %91
  store double 0.000000e+00, double* %92, align 8
  %93 = load i32, i32* %7, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %94
  store double 0.000000e+00, double* %95, align 8
  %96 = load i32, i32* %7, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %97
  store double 0.000000e+00, double* %98, align 8
  %99 = load i32, i32* %7, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %100
  store double 0.000000e+00, double* %101, align 8
  br label %102

; <label>:102:                                    ; preds = %89
  %103 = load i32, i32* %7, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %7, align 4
  br label %82

; <label>:105:                                    ; preds = %82
  store double 0.000000e+00, double* %11, align 8
  store i32 1, i32* %9, align 4
  br label %106

; <label>:106:                                    ; preds = %168, %105
  %107 = load i32, i32* %9, align 4
  %108 = icmp sle i32 %107, 1
  br i1 %108, label %109, label %171

; <label>:109:                                    ; preds = %106
  call void @conj_grad(i32* getelementptr inbounds ([2198001 x i32], [2198001 x i32]* @colidx, i32 0, i32 0), i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i32 0, i32 0), double* getelementptr inbounds ([2198001 x double], [2198001 x double]* @a, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i32 0, i32 0), double* %12)
  store double 0.000000e+00, double* %13, align 8
  store double 0.000000e+00, double* %14, align 8
  store i32 1, i32* %7, align 4
  br label %110

; <label>:110:                                    ; preds = %140, %109
  %111 = load i32, i32* %7, align 4
  %112 = load i32, i32* @lastcol, align 4
  %113 = load i32, i32* @firstcol, align 4
  %114 = sub nsw i32 %112, %113
  %115 = add nsw i32 %114, 1
  %116 = icmp sle i32 %111, %115
  br i1 %116, label %117, label %143

; <label>:117:                                    ; preds = %110
  %118 = load double, double* %13, align 8
  %119 = load i32, i32* %7, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %120
  %122 = load double, double* %121, align 8
  %123 = load i32, i32* %7, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %124
  %126 = load double, double* %125, align 8
  %127 = fmul double %122, %126
  %128 = fadd double %118, %127
  store double %128, double* %13, align 8
  %129 = load double, double* %14, align 8
  %130 = load i32, i32* %7, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %131
  %133 = load double, double* %132, align 8
  %134 = load i32, i32* %7, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fmul double %133, %137
  %139 = fadd double %129, %138
  store double %139, double* %14, align 8
  br label %140

; <label>:140:                                    ; preds = %117
  %141 = load i32, i32* %7, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %7, align 4
  br label %110

; <label>:143:                                    ; preds = %110
  %144 = load double, double* %14, align 8
  %145 = call double @sqrt(double %144) #5
  %146 = fdiv double 1.000000e+00, %145
  store double %146, double* %14, align 8
  store i32 1, i32* %7, align 4
  br label %147

; <label>:147:                                    ; preds = %164, %143
  %148 = load i32, i32* %7, align 4
  %149 = load i32, i32* @lastcol, align 4
  %150 = load i32, i32* @firstcol, align 4
  %151 = sub nsw i32 %149, %150
  %152 = add nsw i32 %151, 1
  %153 = icmp sle i32 %148, %152
  br i1 %153, label %154, label %167

; <label>:154:                                    ; preds = %147
  %155 = load double, double* %14, align 8
  %156 = load i32, i32* %7, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %157
  %159 = load double, double* %158, align 8
  %160 = fmul double %155, %159
  %161 = load i32, i32* %7, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %162
  store double %160, double* %163, align 8
  br label %164

; <label>:164:                                    ; preds = %154
  %165 = load i32, i32* %7, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %7, align 4
  br label %147

; <label>:167:                                    ; preds = %147
  br label %168

; <label>:168:                                    ; preds = %167
  %169 = load i32, i32* %9, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %9, align 4
  br label %106

; <label>:171:                                    ; preds = %106
  store i32 1, i32* %6, align 4
  br label %172

; <label>:172:                                    ; preds = %179, %171
  %173 = load i32, i32* %6, align 4
  %174 = icmp sle i32 %173, 14001
  br i1 %174, label %175, label %182

; <label>:175:                                    ; preds = %172
  %176 = load i32, i32* %6, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %177
  store double 1.000000e+00, double* %178, align 8
  br label %179

; <label>:179:                                    ; preds = %175
  %180 = load i32, i32* %6, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %6, align 4
  br label %172

; <label>:182:                                    ; preds = %172
  store double 0.000000e+00, double* %11, align 8
  call void @timer_clear(i32 1)
  call void @timer_start(i32 1)
  store i32 1, i32* %9, align 4
  br label %183

; <label>:183:                                    ; preds = %257, %182
  %184 = load i32, i32* %9, align 4
  %185 = icmp sle i32 %184, 15
  br i1 %185, label %186, label %260

; <label>:186:                                    ; preds = %183
  call void @conj_grad(i32* getelementptr inbounds ([2198001 x i32], [2198001 x i32]* @colidx, i32 0, i32 0), i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i32 0, i32 0), double* getelementptr inbounds ([2198001 x double], [2198001 x double]* @a, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i32 0, i32 0), double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i32 0, i32 0), double* %12)
  store double 0.000000e+00, double* %13, align 8
  store double 0.000000e+00, double* %14, align 8
  store i32 1, i32* %7, align 4
  br label %187

; <label>:187:                                    ; preds = %217, %186
  %188 = load i32, i32* %7, align 4
  %189 = load i32, i32* @lastcol, align 4
  %190 = load i32, i32* @firstcol, align 4
  %191 = sub nsw i32 %189, %190
  %192 = add nsw i32 %191, 1
  %193 = icmp sle i32 %188, %192
  br i1 %193, label %194, label %220

; <label>:194:                                    ; preds = %187
  %195 = load double, double* %13, align 8
  %196 = load i32, i32* %7, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %197
  %199 = load double, double* %198, align 8
  %200 = load i32, i32* %7, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %201
  %203 = load double, double* %202, align 8
  %204 = fmul double %199, %203
  %205 = fadd double %195, %204
  store double %205, double* %13, align 8
  %206 = load double, double* %14, align 8
  %207 = load i32, i32* %7, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %208
  %210 = load double, double* %209, align 8
  %211 = load i32, i32* %7, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %212
  %214 = load double, double* %213, align 8
  %215 = fmul double %210, %214
  %216 = fadd double %206, %215
  store double %216, double* %14, align 8
  br label %217

; <label>:217:                                    ; preds = %194
  %218 = load i32, i32* %7, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %7, align 4
  br label %187

; <label>:220:                                    ; preds = %187
  %221 = load double, double* %14, align 8
  %222 = call double @sqrt(double %221) #5
  %223 = fdiv double 1.000000e+00, %222
  store double %223, double* %14, align 8
  %224 = load double, double* %13, align 8
  %225 = fdiv double 1.000000e+00, %224
  %226 = fadd double 2.000000e+01, %225
  store double %226, double* %11, align 8
  %227 = load i32, i32* %9, align 4
  %228 = icmp eq i32 %227, 1
  br i1 %228, label %229, label %231

; <label>:229:                                    ; preds = %220
  %230 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.3, i32 0, i32 0))
  br label %231

; <label>:231:                                    ; preds = %229, %220
  %232 = load i32, i32* %9, align 4
  %233 = load double, double* %12, align 8
  %234 = load double, double* %11, align 8
  %235 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i32 0, i32 0), i32 %232, double %233, double %234)
  store i32 1, i32* %7, align 4
  br label %236

; <label>:236:                                    ; preds = %253, %231
  %237 = load i32, i32* %7, align 4
  %238 = load i32, i32* @lastcol, align 4
  %239 = load i32, i32* @firstcol, align 4
  %240 = sub nsw i32 %238, %239
  %241 = add nsw i32 %240, 1
  %242 = icmp sle i32 %237, %241
  br i1 %242, label %243, label %256

; <label>:243:                                    ; preds = %236
  %244 = load double, double* %14, align 8
  %245 = load i32, i32* %7, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %246
  %248 = load double, double* %247, align 8
  %249 = fmul double %244, %248
  %250 = load i32, i32* %7, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %251
  store double %249, double* %252, align 8
  br label %253

; <label>:253:                                    ; preds = %243
  %254 = load i32, i32* %7, align 4
  %255 = add nsw i32 %254, 1
  store i32 %255, i32* %7, align 4
  br label %236

; <label>:256:                                    ; preds = %236
  br label %257

; <label>:257:                                    ; preds = %256
  %258 = load i32, i32* %9, align 4
  %259 = add nsw i32 %258, 1
  store i32 %259, i32* %9, align 4
  br label %183

; <label>:260:                                    ; preds = %183
  call void @timer_stop(i32 1)
  %261 = call double @timer_read(i32 1)
  store double %261, double* %15, align 8
  %262 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0))
  store double 1.000000e-10, double* %20, align 8
  %263 = load i8, i8* %17, align 1
  %264 = sext i8 %263 to i32
  %265 = icmp ne i32 %264, 85
  br i1 %265, label %266, label %288

; <label>:266:                                    ; preds = %260
  %267 = load double, double* %11, align 8
  %268 = load double, double* %19, align 8
  %269 = fsub double %267, %268
  %270 = call double @llvm.fabs.f64(double %269)
  %271 = load double, double* %20, align 8
  %272 = fcmp ole double %270, %271
  br i1 %272, label %273, label %281

; <label>:273:                                    ; preds = %266
  store i32 1, i32* %18, align 4
  %274 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i32 0, i32 0))
  %275 = load double, double* %11, align 8
  %276 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i32 0, i32 0), double %275)
  %277 = load double, double* %11, align 8
  %278 = load double, double* %19, align 8
  %279 = fsub double %277, %278
  %280 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i32 0, i32 0), double %279)
  br label %287

; <label>:281:                                    ; preds = %266
  store i32 0, i32* %18, align 4
  %282 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0))
  %283 = load double, double* %11, align 8
  %284 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i32 0, i32 0), double %283)
  %285 = load double, double* %19, align 8
  %286 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i32 0, i32 0), double %285)
  br label %287

; <label>:287:                                    ; preds = %281, %273
  br label %291

; <label>:288:                                    ; preds = %260
  store i32 0, i32* %18, align 4
  %289 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0))
  %290 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.13, i32 0, i32 0))
  br label %291

; <label>:291:                                    ; preds = %288, %287
  %292 = load double, double* %15, align 8
  %293 = fcmp une double %292, 0.000000e+00
  br i1 %293, label %294, label %298

; <label>:294:                                    ; preds = %291
  %295 = load double, double* %15, align 8
  %296 = fdiv double 1.496460e+09, %295
  %297 = fdiv double %296, 1.000000e+06
  store double %297, double* %16, align 8
  br label %299

; <label>:298:                                    ; preds = %291
  store double 0.000000e+00, double* %16, align 8
  br label %299

; <label>:299:                                    ; preds = %298, %294
  %300 = load i8, i8* %17, align 1
  %301 = load i32, i32* %10, align 4
  %302 = load double, double* %15, align 8
  %303 = load double, double* %16, align 8
  %304 = load i32, i32* %18, align 4
  call void @c_print_results(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8 signext %300, i32 14000, i32 0, i32 0, i32 15, i32 %301, double %302, double %303, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.15, i32 0, i32 0), i32 %304, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.23, i32 0, i32 0))
  %305 = load i32, i32* %3, align 4
  ret i32 %305
}

declare i32 @printf(i8*, ...) #1

declare double @randlc(double*, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @makea(i32, i32, double*, i32*, i32*, i32, i32, i32, i32, i32, double, i32*, i32*, double*, double*, i32*, double) #0 {
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca double*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca double, align 8
  %29 = alloca i32*, align 8
  %30 = alloca i32*, align 8
  %31 = alloca double*, align 8
  %32 = alloca double*, align 8
  %33 = alloca i32*, align 8
  %34 = alloca double, align 8
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca double, align 8
  %43 = alloca double, align 8
  %44 = alloca double, align 8
  %45 = alloca i32, align 4
  store i32 %0, i32* %18, align 4
  store i32 %1, i32* %19, align 4
  store double* %2, double** %20, align 8
  store i32* %3, i32** %21, align 8
  store i32* %4, i32** %22, align 8
  store i32 %5, i32* %23, align 4
  store i32 %6, i32* %24, align 4
  store i32 %7, i32* %25, align 4
  store i32 %8, i32* %26, align 4
  store i32 %9, i32* %27, align 4
  store double %10, double* %28, align 8
  store i32* %11, i32** %29, align 8
  store i32* %12, i32** %30, align 8
  store double* %13, double** %31, align 8
  store double* %14, double** %32, align 8
  store i32* %15, i32** %33, align 8
  store double %16, double* %34, align 8
  store double 1.000000e+00, double* %42, align 8
  %46 = load double, double* %28, align 8
  %47 = load i32, i32* %18, align 4
  %48 = sitofp i32 %47 to double
  %49 = fdiv double 1.000000e+00, %48
  %50 = call double @pow(double %46, double %49) #5
  store double %50, double* %43, align 8
  store i32 0, i32* %36, align 4
  store i32 1, i32* %35, align 4
  br label %51

; <label>:51:                                     ; preds = %62, %17
  %52 = load i32, i32* %35, align 4
  %53 = load i32, i32* %18, align 4
  %54 = icmp sle i32 %52, %53
  br i1 %54, label %55, label %65

; <label>:55:                                     ; preds = %51
  %56 = load i32*, i32** %21, align 8
  %57 = load i32, i32* %18, align 4
  %58 = load i32, i32* %35, align 4
  %59 = add nsw i32 %57, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32* %56, i64 %60
  store i32 0, i32* %61, align 4
  br label %62

; <label>:62:                                     ; preds = %55
  %63 = load i32, i32* %35, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %35, align 4
  br label %51

; <label>:65:                                     ; preds = %51
  store i32 1, i32* %37, align 4
  br label %66

; <label>:66:                                     ; preds = %176, %65
  %67 = load i32, i32* %37, align 4
  %68 = load i32, i32* %18, align 4
  %69 = icmp sle i32 %67, %68
  br i1 %69, label %70, label %179

; <label>:70:                                     ; preds = %66
  %71 = load i32, i32* %23, align 4
  store i32 %71, i32* %41, align 4
  %72 = load i32, i32* %18, align 4
  %73 = load i32, i32* %41, align 4
  %74 = load double*, double** %32, align 8
  %75 = load i32*, i32** %33, align 8
  %76 = load i32*, i32** %21, align 8
  %77 = getelementptr inbounds i32, i32* %76, i64 0
  %78 = load i32*, i32** %21, align 8
  %79 = load i32, i32* %18, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32* %78, i64 %80
  call void @sprnvc(i32 %72, i32 %73, double* %74, i32* %75, i32* %77, i32* %81)
  %82 = load i32, i32* %18, align 4
  %83 = load double*, double** %32, align 8
  %84 = load i32*, i32** %33, align 8
  %85 = load i32, i32* %37, align 4
  call void @vecset(i32 %82, double* %83, i32* %84, i32* %41, i32 %85, double 5.000000e-01)
  store i32 1, i32* %38, align 4
  br label %86

; <label>:86:                                     ; preds = %169, %70
  %87 = load i32, i32* %38, align 4
  %88 = load i32, i32* %41, align 4
  %89 = icmp sle i32 %87, %88
  br i1 %89, label %90, label %172

; <label>:90:                                     ; preds = %86
  %91 = load i32*, i32** %33, align 8
  %92 = load i32, i32* %38, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32* %91, i64 %93
  %95 = load i32, i32* %94, align 4
  store i32 %95, i32* %45, align 4
  %96 = load i32, i32* %45, align 4
  %97 = load i32, i32* %26, align 4
  %98 = icmp sge i32 %96, %97
  br i1 %98, label %99, label %168

; <label>:99:                                     ; preds = %90
  %100 = load i32, i32* %45, align 4
  %101 = load i32, i32* %27, align 4
  %102 = icmp sle i32 %100, %101
  br i1 %102, label %103, label %168

; <label>:103:                                    ; preds = %99
  %104 = load double, double* %42, align 8
  %105 = load double*, double** %32, align 8
  %106 = load i32, i32* %38, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double* %105, i64 %107
  %109 = load double, double* %108, align 8
  %110 = fmul double %104, %109
  store double %110, double* %44, align 8
  store i32 1, i32* %39, align 4
  br label %111

; <label>:111:                                    ; preds = %164, %103
  %112 = load i32, i32* %39, align 4
  %113 = load i32, i32* %41, align 4
  %114 = icmp sle i32 %112, %113
  br i1 %114, label %115, label %167

; <label>:115:                                    ; preds = %111
  %116 = load i32*, i32** %33, align 8
  %117 = load i32, i32* %39, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32* %116, i64 %118
  %120 = load i32, i32* %119, align 4
  store i32 %120, i32* %40, align 4
  %121 = load i32, i32* %40, align 4
  %122 = load i32, i32* %24, align 4
  %123 = icmp sge i32 %121, %122
  br i1 %123, label %124, label %163

; <label>:124:                                    ; preds = %115
  %125 = load i32, i32* %40, align 4
  %126 = load i32, i32* %25, align 4
  %127 = icmp sle i32 %125, %126
  br i1 %127, label %128, label %163

; <label>:128:                                    ; preds = %124
  %129 = load i32, i32* %36, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %36, align 4
  %131 = load i32, i32* %36, align 4
  %132 = load i32, i32* %19, align 4
  %133 = icmp sgt i32 %131, %132
  br i1 %133, label %134, label %141

; <label>:134:                                    ; preds = %128
  %135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.24, i32 0, i32 0))
  %136 = load i32, i32* %36, align 4
  %137 = load i32, i32* %19, align 4
  %138 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i32 0, i32 0), i32 %136, i32 %137)
  %139 = load i32, i32* %37, align 4
  %140 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i32 0, i32 0), i32 %139)
  call void @exit(i32 1) #6
  unreachable

; <label>:141:                                    ; preds = %128
  %142 = load i32, i32* %45, align 4
  %143 = load i32*, i32** %30, align 8
  %144 = load i32, i32* %36, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32* %143, i64 %145
  store i32 %142, i32* %146, align 4
  %147 = load i32, i32* %40, align 4
  %148 = load i32*, i32** %29, align 8
  %149 = load i32, i32* %36, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32* %148, i64 %150
  store i32 %147, i32* %151, align 4
  %152 = load double*, double** %32, align 8
  %153 = load i32, i32* %39, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds double, double* %152, i64 %154
  %156 = load double, double* %155, align 8
  %157 = load double, double* %44, align 8
  %158 = fmul double %156, %157
  %159 = load double*, double** %31, align 8
  %160 = load i32, i32* %36, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds double, double* %159, i64 %161
  store double %158, double* %162, align 8
  br label %163

; <label>:163:                                    ; preds = %141, %124, %115
  br label %164

; <label>:164:                                    ; preds = %163
  %165 = load i32, i32* %39, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %39, align 4
  br label %111

; <label>:167:                                    ; preds = %111
  br label %168

; <label>:168:                                    ; preds = %167, %99, %90
  br label %169

; <label>:169:                                    ; preds = %168
  %170 = load i32, i32* %38, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %38, align 4
  br label %86

; <label>:172:                                    ; preds = %86
  %173 = load double, double* %42, align 8
  %174 = load double, double* %43, align 8
  %175 = fmul double %173, %174
  store double %175, double* %42, align 8
  br label %176

; <label>:176:                                    ; preds = %172
  %177 = load i32, i32* %37, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %37, align 4
  br label %66

; <label>:179:                                    ; preds = %66
  %180 = load i32, i32* %24, align 4
  store i32 %180, i32* %35, align 4
  br label %181

; <label>:181:                                    ; preds = %228, %179
  %182 = load i32, i32* %35, align 4
  %183 = load i32, i32* %25, align 4
  %184 = icmp sle i32 %182, %183
  br i1 %184, label %185, label %231

; <label>:185:                                    ; preds = %181
  %186 = load i32, i32* %35, align 4
  %187 = load i32, i32* %26, align 4
  %188 = icmp sge i32 %186, %187
  br i1 %188, label %189, label %227

; <label>:189:                                    ; preds = %185
  %190 = load i32, i32* %35, align 4
  %191 = load i32, i32* %27, align 4
  %192 = icmp sle i32 %190, %191
  br i1 %192, label %193, label %227

; <label>:193:                                    ; preds = %189
  %194 = load i32, i32* %18, align 4
  %195 = load i32, i32* %35, align 4
  %196 = add nsw i32 %194, %195
  store i32 %196, i32* %37, align 4
  %197 = load i32, i32* %36, align 4
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %36, align 4
  %199 = load i32, i32* %36, align 4
  %200 = load i32, i32* %19, align 4
  %201 = icmp sgt i32 %199, %200
  br i1 %201, label %202, label %209

; <label>:202:                                    ; preds = %193
  %203 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.24, i32 0, i32 0))
  %204 = load i32, i32* %36, align 4
  %205 = load i32, i32* %19, align 4
  %206 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i32 0, i32 0), i32 %204, i32 %205)
  %207 = load i32, i32* %37, align 4
  %208 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i32 0, i32 0), i32 %207)
  call void @exit(i32 1) #6
  unreachable

; <label>:209:                                    ; preds = %193
  %210 = load i32, i32* %35, align 4
  %211 = load i32*, i32** %30, align 8
  %212 = load i32, i32* %36, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds i32, i32* %211, i64 %213
  store i32 %210, i32* %214, align 4
  %215 = load i32, i32* %35, align 4
  %216 = load i32*, i32** %29, align 8
  %217 = load i32, i32* %36, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i32, i32* %216, i64 %218
  store i32 %215, i32* %219, align 4
  %220 = load double, double* %28, align 8
  %221 = load double, double* %34, align 8
  %222 = fsub double %220, %221
  %223 = load double*, double** %31, align 8
  %224 = load i32, i32* %36, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds double, double* %223, i64 %225
  store double %222, double* %226, align 8
  br label %227

; <label>:227:                                    ; preds = %209, %189, %185
  br label %228

; <label>:228:                                    ; preds = %227
  %229 = load i32, i32* %35, align 4
  %230 = add nsw i32 %229, 1
  store i32 %230, i32* %35, align 4
  br label %181

; <label>:231:                                    ; preds = %181
  %232 = load double*, double** %20, align 8
  %233 = load i32*, i32** %21, align 8
  %234 = load i32*, i32** %22, align 8
  %235 = load i32, i32* %18, align 4
  %236 = load i32*, i32** %29, align 8
  %237 = load i32*, i32** %30, align 8
  %238 = load double*, double** %31, align 8
  %239 = load i32, i32* %24, align 4
  %240 = load i32, i32* %25, align 4
  %241 = load double*, double** %32, align 8
  %242 = load i32*, i32** %33, align 8
  %243 = getelementptr inbounds i32, i32* %242, i64 0
  %244 = load i32*, i32** %33, align 8
  %245 = load i32, i32* %18, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds i32, i32* %244, i64 %246
  %248 = load i32, i32* %36, align 4
  call void @sparse(double* %232, i32* %233, i32* %234, i32 %235, i32* %236, i32* %237, double* %238, i32 %239, i32 %240, double* %241, i32* %243, i32* %247, i32 %248)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @conj_grad(i32*, i32*, double*, double*, double*, double*, double*, double*, double*) #0 {
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca double*, align 8
  %18 = alloca double*, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  store i32* %0, i32** %10, align 8
  store i32* %1, i32** %11, align 8
  store double* %2, double** %12, align 8
  store double* %3, double** %13, align 8
  store double* %4, double** %14, align 8
  store double* %5, double** %15, align 8
  store double* %6, double** %16, align 8
  store double* %7, double** %17, align 8
  store double* %8, double** %18, align 8
  store i32 25, i32* %29, align 4
  store double 0.000000e+00, double* %21, align 8
  store i32 1, i32* %26, align 4
  br label %30

; <label>:30:                                     ; preds = %62, %9
  %31 = load i32, i32* %26, align 4
  %32 = load i32, i32* @naa, align 4
  %33 = add nsw i32 %32, 1
  %34 = icmp sle i32 %31, %33
  br i1 %34, label %35, label %65

; <label>:35:                                     ; preds = %30
  %36 = load double*, double** %16, align 8
  %37 = load i32, i32* %26, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double* %36, i64 %38
  store double 0.000000e+00, double* %39, align 8
  %40 = load double*, double** %13, align 8
  %41 = load i32, i32* %26, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double* %40, i64 %42
  store double 0.000000e+00, double* %43, align 8
  %44 = load double*, double** %12, align 8
  %45 = load i32, i32* %26, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double* %44, i64 %46
  %48 = load double, double* %47, align 8
  %49 = load double*, double** %17, align 8
  %50 = load i32, i32* %26, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double* %49, i64 %51
  store double %48, double* %52, align 8
  %53 = load double*, double** %17, align 8
  %54 = load i32, i32* %26, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double* %53, i64 %55
  %57 = load double, double* %56, align 8
  %58 = load double*, double** %15, align 8
  %59 = load i32, i32* %26, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double* %58, i64 %60
  store double %57, double* %61, align 8
  br label %62

; <label>:62:                                     ; preds = %35
  %63 = load i32, i32* %26, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %26, align 4
  br label %30

; <label>:65:                                     ; preds = %30
  store i32 1, i32* %26, align 4
  br label %66

; <label>:66:                                     ; preds = %87, %65
  %67 = load i32, i32* %26, align 4
  %68 = load i32, i32* @lastcol, align 4
  %69 = load i32, i32* @firstcol, align 4
  %70 = sub nsw i32 %68, %69
  %71 = add nsw i32 %70, 1
  %72 = icmp sle i32 %67, %71
  br i1 %72, label %73, label %90

; <label>:73:                                     ; preds = %66
  %74 = load double, double* %21, align 8
  %75 = load double*, double** %17, align 8
  %76 = load i32, i32* %26, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double* %75, i64 %77
  %79 = load double, double* %78, align 8
  %80 = load double*, double** %17, align 8
  %81 = load i32, i32* %26, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double* %80, i64 %82
  %84 = load double, double* %83, align 8
  %85 = fmul double %79, %84
  %86 = fadd double %74, %85
  store double %86, double* %21, align 8
  br label %87

; <label>:87:                                     ; preds = %73
  %88 = load i32, i32* %26, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %26, align 4
  br label %66

; <label>:90:                                     ; preds = %66
  store i32 1, i32* %28, align 4
  br label %91

; <label>:91:                                     ; preds = %271, %90
  %92 = load i32, i32* %28, align 4
  %93 = load i32, i32* %29, align 4
  %94 = icmp sle i32 %92, %93
  br i1 %94, label %95, label %274

; <label>:95:                                     ; preds = %91
  %96 = load double, double* %21, align 8
  store double %96, double* %22, align 8
  store double 0.000000e+00, double* %19, align 8
  store double 0.000000e+00, double* %21, align 8
  store i32 1, i32* %26, align 4
  br label %97

; <label>:97:                                     ; preds = %146, %95
  %98 = load i32, i32* %26, align 4
  %99 = load i32, i32* @lastrow, align 4
  %100 = load i32, i32* @firstrow, align 4
  %101 = sub nsw i32 %99, %100
  %102 = add nsw i32 %101, 1
  %103 = icmp sle i32 %98, %102
  br i1 %103, label %104, label %149

; <label>:104:                                    ; preds = %97
  store double 0.000000e+00, double* %20, align 8
  %105 = load i32*, i32** %11, align 8
  %106 = load i32, i32* %26, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32* %105, i64 %107
  %109 = load i32, i32* %108, align 4
  store i32 %109, i32* %27, align 4
  br label %110

; <label>:110:                                    ; preds = %137, %104
  %111 = load i32, i32* %27, align 4
  %112 = load i32*, i32** %11, align 8
  %113 = load i32, i32* %26, align 4
  %114 = add nsw i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32* %112, i64 %115
  %117 = load i32, i32* %116, align 4
  %118 = icmp slt i32 %111, %117
  br i1 %118, label %119, label %140

; <label>:119:                                    ; preds = %110
  %120 = load double, double* %20, align 8
  %121 = load double*, double** %14, align 8
  %122 = load i32, i32* %27, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double* %121, i64 %123
  %125 = load double, double* %124, align 8
  %126 = load double*, double** %15, align 8
  %127 = load i32*, i32** %10, align 8
  %128 = load i32, i32* %27, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32* %127, i64 %129
  %131 = load i32, i32* %130, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds double, double* %126, i64 %132
  %134 = load double, double* %133, align 8
  %135 = fmul double %125, %134
  %136 = fadd double %120, %135
  store double %136, double* %20, align 8
  br label %137

; <label>:137:                                    ; preds = %119
  %138 = load i32, i32* %27, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %27, align 4
  br label %110

; <label>:140:                                    ; preds = %110
  %141 = load double, double* %20, align 8
  %142 = load double*, double** %16, align 8
  %143 = load i32, i32* %26, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, double* %142, i64 %144
  store double %141, double* %145, align 8
  br label %146

; <label>:146:                                    ; preds = %140
  %147 = load i32, i32* %26, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, i32* %26, align 4
  br label %97

; <label>:149:                                    ; preds = %97
  store i32 1, i32* %26, align 4
  br label %150

; <label>:150:                                    ; preds = %171, %149
  %151 = load i32, i32* %26, align 4
  %152 = load i32, i32* @lastcol, align 4
  %153 = load i32, i32* @firstcol, align 4
  %154 = sub nsw i32 %152, %153
  %155 = add nsw i32 %154, 1
  %156 = icmp sle i32 %151, %155
  br i1 %156, label %157, label %174

; <label>:157:                                    ; preds = %150
  %158 = load double, double* %19, align 8
  %159 = load double*, double** %15, align 8
  %160 = load i32, i32* %26, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds double, double* %159, i64 %161
  %163 = load double, double* %162, align 8
  %164 = load double*, double** %16, align 8
  %165 = load i32, i32* %26, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds double, double* %164, i64 %166
  %168 = load double, double* %167, align 8
  %169 = fmul double %163, %168
  %170 = fadd double %158, %169
  store double %170, double* %19, align 8
  br label %171

; <label>:171:                                    ; preds = %157
  %172 = load i32, i32* %26, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %26, align 4
  br label %150

; <label>:174:                                    ; preds = %150
  %175 = load double, double* %22, align 8
  %176 = load double, double* %19, align 8
  %177 = fdiv double %175, %176
  store double %177, double* %23, align 8
  store i32 1, i32* %26, align 4
  br label %178

; <label>:178:                                    ; preds = %233, %174
  %179 = load i32, i32* %26, align 4
  %180 = load i32, i32* @lastcol, align 4
  %181 = load i32, i32* @firstcol, align 4
  %182 = sub nsw i32 %180, %181
  %183 = add nsw i32 %182, 1
  %184 = icmp sle i32 %179, %183
  br i1 %184, label %185, label %236

; <label>:185:                                    ; preds = %178
  %186 = load double*, double** %13, align 8
  %187 = load i32, i32* %26, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds double, double* %186, i64 %188
  %190 = load double, double* %189, align 8
  %191 = load double, double* %23, align 8
  %192 = load double*, double** %15, align 8
  %193 = load i32, i32* %26, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds double, double* %192, i64 %194
  %196 = load double, double* %195, align 8
  %197 = fmul double %191, %196
  %198 = fadd double %190, %197
  %199 = load double*, double** %13, align 8
  %200 = load i32, i32* %26, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds double, double* %199, i64 %201
  store double %198, double* %202, align 8
  %203 = load double*, double** %17, align 8
  %204 = load i32, i32* %26, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds double, double* %203, i64 %205
  %207 = load double, double* %206, align 8
  %208 = load double, double* %23, align 8
  %209 = load double*, double** %16, align 8
  %210 = load i32, i32* %26, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds double, double* %209, i64 %211
  %213 = load double, double* %212, align 8
  %214 = fmul double %208, %213
  %215 = fsub double %207, %214
  %216 = load double*, double** %17, align 8
  %217 = load i32, i32* %26, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds double, double* %216, i64 %218
  store double %215, double* %219, align 8
  %220 = load double, double* %21, align 8
  %221 = load double*, double** %17, align 8
  %222 = load i32, i32* %26, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds double, double* %221, i64 %223
  %225 = load double, double* %224, align 8
  %226 = load double*, double** %17, align 8
  %227 = load i32, i32* %26, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds double, double* %226, i64 %228
  %230 = load double, double* %229, align 8
  %231 = fmul double %225, %230
  %232 = fadd double %220, %231
  store double %232, double* %21, align 8
  br label %233

; <label>:233:                                    ; preds = %185
  %234 = load i32, i32* %26, align 4
  %235 = add nsw i32 %234, 1
  store i32 %235, i32* %26, align 4
  br label %178

; <label>:236:                                    ; preds = %178
  %237 = load double, double* %21, align 8
  %238 = load double, double* %22, align 8
  %239 = fdiv double %237, %238
  store double %239, double* %24, align 8
  store i32 1, i32* %26, align 4
  br label %240

; <label>:240:                                    ; preds = %265, %236
  %241 = load i32, i32* %26, align 4
  %242 = load i32, i32* @lastcol, align 4
  %243 = load i32, i32* @firstcol, align 4
  %244 = sub nsw i32 %242, %243
  %245 = add nsw i32 %244, 1
  %246 = icmp sle i32 %241, %245
  br i1 %246, label %247, label %268

; <label>:247:                                    ; preds = %240
  %248 = load double*, double** %17, align 8
  %249 = load i32, i32* %26, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds double, double* %248, i64 %250
  %252 = load double, double* %251, align 8
  %253 = load double, double* %24, align 8
  %254 = load double*, double** %15, align 8
  %255 = load i32, i32* %26, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds double, double* %254, i64 %256
  %258 = load double, double* %257, align 8
  %259 = fmul double %253, %258
  %260 = fadd double %252, %259
  %261 = load double*, double** %15, align 8
  %262 = load i32, i32* %26, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds double, double* %261, i64 %263
  store double %260, double* %264, align 8
  br label %265

; <label>:265:                                    ; preds = %247
  %266 = load i32, i32* %26, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %26, align 4
  br label %240

; <label>:268:                                    ; preds = %240
  %269 = load i32, i32* @conj_grad.callcount, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, i32* @conj_grad.callcount, align 4
  br label %271

; <label>:271:                                    ; preds = %268
  %272 = load i32, i32* %28, align 4
  %273 = add nsw i32 %272, 1
  store i32 %273, i32* %28, align 4
  br label %91

; <label>:274:                                    ; preds = %91
  store double 0.000000e+00, double* %20, align 8
  store i32 1, i32* %26, align 4
  br label %275

; <label>:275:                                    ; preds = %325, %274
  %276 = load i32, i32* %26, align 4
  %277 = load i32, i32* @lastrow, align 4
  %278 = load i32, i32* @firstrow, align 4
  %279 = sub nsw i32 %277, %278
  %280 = add nsw i32 %279, 1
  %281 = icmp sle i32 %276, %280
  br i1 %281, label %282, label %328

; <label>:282:                                    ; preds = %275
  store double 0.000000e+00, double* %19, align 8
  %283 = load i32*, i32** %11, align 8
  %284 = load i32, i32* %26, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i32, i32* %283, i64 %285
  %287 = load i32, i32* %286, align 4
  store i32 %287, i32* %27, align 4
  br label %288

; <label>:288:                                    ; preds = %316, %282
  %289 = load i32, i32* %27, align 4
  %290 = load i32*, i32** %11, align 8
  %291 = load i32, i32* %26, align 4
  %292 = add nsw i32 %291, 1
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32* %290, i64 %293
  %295 = load i32, i32* %294, align 4
  %296 = sub nsw i32 %295, 1
  %297 = icmp sle i32 %289, %296
  br i1 %297, label %298, label %319

; <label>:298:                                    ; preds = %288
  %299 = load double, double* %19, align 8
  %300 = load double*, double** %14, align 8
  %301 = load i32, i32* %27, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds double, double* %300, i64 %302
  %304 = load double, double* %303, align 8
  %305 = load double*, double** %13, align 8
  %306 = load i32*, i32** %10, align 8
  %307 = load i32, i32* %27, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds i32, i32* %306, i64 %308
  %310 = load i32, i32* %309, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds double, double* %305, i64 %311
  %313 = load double, double* %312, align 8
  %314 = fmul double %304, %313
  %315 = fadd double %299, %314
  store double %315, double* %19, align 8
  br label %316

; <label>:316:                                    ; preds = %298
  %317 = load i32, i32* %27, align 4
  %318 = add nsw i32 %317, 1
  store i32 %318, i32* %27, align 4
  br label %288

; <label>:319:                                    ; preds = %288
  %320 = load double, double* %19, align 8
  %321 = load double*, double** %17, align 8
  %322 = load i32, i32* %26, align 4
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds double, double* %321, i64 %323
  store double %320, double* %324, align 8
  br label %325

; <label>:325:                                    ; preds = %319
  %326 = load i32, i32* %26, align 4
  %327 = add nsw i32 %326, 1
  store i32 %327, i32* %26, align 4
  br label %275

; <label>:328:                                    ; preds = %275
  store i32 1, i32* %26, align 4
  br label %329

; <label>:329:                                    ; preds = %353, %328
  %330 = load i32, i32* %26, align 4
  %331 = load i32, i32* @lastcol, align 4
  %332 = load i32, i32* @firstcol, align 4
  %333 = sub nsw i32 %331, %332
  %334 = add nsw i32 %333, 1
  %335 = icmp sle i32 %330, %334
  br i1 %335, label %336, label %356

; <label>:336:                                    ; preds = %329
  %337 = load double*, double** %12, align 8
  %338 = load i32, i32* %26, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds double, double* %337, i64 %339
  %341 = load double, double* %340, align 8
  %342 = load double*, double** %17, align 8
  %343 = load i32, i32* %26, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds double, double* %342, i64 %344
  %346 = load double, double* %345, align 8
  %347 = fsub double %341, %346
  store double %347, double* %19, align 8
  %348 = load double, double* %20, align 8
  %349 = load double, double* %19, align 8
  %350 = load double, double* %19, align 8
  %351 = fmul double %349, %350
  %352 = fadd double %348, %351
  store double %352, double* %20, align 8
  br label %353

; <label>:353:                                    ; preds = %336
  %354 = load i32, i32* %26, align 4
  %355 = add nsw i32 %354, 1
  store i32 %355, i32* %26, align 4
  br label %329

; <label>:356:                                    ; preds = %329
  %357 = load double, double* %20, align 8
  %358 = call double @sqrt(double %357) #5
  %359 = load double*, double** %18, align 8
  store double %358, double* %359, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare void @timer_clear(i32) #1

declare void @timer_start(i32) #1

declare void @timer_stop(i32) #1

declare double @timer_read(i32) #1

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #3

declare void @c_print_results(i8*, i8 signext, i32, i32, i32, i32, i32, double, double, i8*, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) #1

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @sprnvc(i32, i32, double*, i32*, i32*, i32*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store double* %2, double** %9, align 8
  store i32* %3, i32** %10, align 8
  store i32* %4, i32** %11, align 8
  store i32* %5, i32** %12, align 8
  store i32 0, i32* %15, align 4
  store i32 0, i32* %14, align 4
  store i32 1, i32* %13, align 4
  br label %20

; <label>:20:                                     ; preds = %23, %6
  %21 = load i32, i32* %13, align 4
  %22 = mul nsw i32 2, %21
  store i32 %22, i32* %13, align 4
  br label %23

; <label>:23:                                     ; preds = %20
  %24 = load i32, i32* %13, align 4
  %25 = load i32, i32* %7, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %20, label %27

; <label>:27:                                     ; preds = %23
  br label %28

; <label>:28:                                     ; preds = %76, %44, %27
  %29 = load i32, i32* %15, align 4
  %30 = load i32, i32* %8, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %77

; <label>:32:                                     ; preds = %28
  %33 = load double, double* @amult, align 8
  %34 = call double @randlc(double* @tran, double %33)
  store double %34, double* %18, align 8
  %35 = load double, double* @amult, align 8
  %36 = call double @randlc(double* @tran, double %35)
  store double %36, double* %19, align 8
  %37 = load double, double* %19, align 8
  %38 = load i32, i32* %13, align 4
  %39 = call i32 @icnvrt(double %37, i32 %38)
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %17, align 4
  %41 = load i32, i32* %17, align 4
  %42 = load i32, i32* %7, align 4
  %43 = icmp sgt i32 %41, %42
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %32
  br label %28

; <label>:45:                                     ; preds = %32
  %46 = load i32*, i32** %12, align 8
  %47 = load i32, i32* %17, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32* %46, i64 %48
  %50 = load i32, i32* %49, align 4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %76

; <label>:52:                                     ; preds = %45
  %53 = load i32*, i32** %12, align 8
  %54 = load i32, i32* %17, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %53, i64 %55
  store i32 1, i32* %56, align 4
  %57 = load i32, i32* %14, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %14, align 4
  %59 = load i32, i32* %17, align 4
  %60 = load i32*, i32** %11, align 8
  %61 = load i32, i32* %14, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32* %60, i64 %62
  store i32 %59, i32* %63, align 4
  %64 = load i32, i32* %15, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %15, align 4
  %66 = load double, double* %18, align 8
  %67 = load double*, double** %9, align 8
  %68 = load i32, i32* %15, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double* %67, i64 %69
  store double %66, double* %70, align 8
  %71 = load i32, i32* %17, align 4
  %72 = load i32*, i32** %10, align 8
  %73 = load i32, i32* %15, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32* %72, i64 %74
  store i32 %71, i32* %75, align 4
  br label %76

; <label>:76:                                     ; preds = %52, %45
  br label %28

; <label>:77:                                     ; preds = %28
  store i32 1, i32* %16, align 4
  br label %78

; <label>:78:                                     ; preds = %92, %77
  %79 = load i32, i32* %16, align 4
  %80 = load i32, i32* %14, align 4
  %81 = icmp sle i32 %79, %80
  br i1 %81, label %82, label %95

; <label>:82:                                     ; preds = %78
  %83 = load i32*, i32** %11, align 8
  %84 = load i32, i32* %16, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32* %83, i64 %85
  %87 = load i32, i32* %86, align 4
  store i32 %87, i32* %17, align 4
  %88 = load i32*, i32** %12, align 8
  %89 = load i32, i32* %17, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32* %88, i64 %90
  store i32 0, i32* %91, align 4
  br label %92

; <label>:92:                                     ; preds = %82
  %93 = load i32, i32* %16, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %16, align 4
  br label %78

; <label>:95:                                     ; preds = %78
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @vecset(i32, double*, i32*, i32*, i32, double) #0 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store i32* %2, i32** %9, align 8
  store i32* %3, i32** %10, align 8
  store i32 %4, i32* %11, align 4
  store double %5, double* %12, align 8
  store i32 0, i32* %14, align 4
  store i32 1, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %35, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32*, i32** %10, align 8
  %18 = load i32, i32* %17, align 4
  %19 = icmp sle i32 %16, %18
  br i1 %19, label %20, label %38

; <label>:20:                                     ; preds = %15
  %21 = load i32*, i32** %9, align 8
  %22 = load i32, i32* %13, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32* %21, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %11, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %20
  %29 = load double, double* %12, align 8
  %30 = load double*, double** %8, align 8
  %31 = load i32, i32* %13, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double* %30, i64 %32
  store double %29, double* %33, align 8
  store i32 1, i32* %14, align 4
  br label %34

; <label>:34:                                     ; preds = %28, %20
  br label %35

; <label>:35:                                     ; preds = %34
  %36 = load i32, i32* %13, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %13, align 4
  br label %15

; <label>:38:                                     ; preds = %15
  %39 = load i32, i32* %14, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %58

; <label>:41:                                     ; preds = %38
  %42 = load i32*, i32** %10, align 8
  %43 = load i32, i32* %42, align 4
  %44 = add nsw i32 %43, 1
  %45 = load i32*, i32** %10, align 8
  store i32 %44, i32* %45, align 4
  %46 = load double, double* %12, align 8
  %47 = load double*, double** %8, align 8
  %48 = load i32*, i32** %10, align 8
  %49 = load i32, i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double* %47, i64 %50
  store double %46, double* %51, align 8
  %52 = load i32, i32* %11, align 4
  %53 = load i32*, i32** %9, align 8
  %54 = load i32*, i32** %10, align 8
  %55 = load i32, i32* %54, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %53, i64 %56
  store i32 %52, i32* %57, align 4
  br label %58

; <label>:58:                                     ; preds = %41, %38
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @sparse(double*, i32*, i32*, i32, i32*, i32*, double*, i32, i32, double*, i32*, i32*, i32) #0 {
  %14 = alloca double*, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32*, align 8
  %19 = alloca i32*, align 8
  %20 = alloca double*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca double*, align 8
  %24 = alloca i32*, align 8
  %25 = alloca i32*, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca double, align 8
  store double* %0, double** %14, align 8
  store i32* %1, i32** %15, align 8
  store i32* %2, i32** %16, align 8
  store i32 %3, i32* %17, align 4
  store i32* %4, i32** %18, align 8
  store i32* %5, i32** %19, align 8
  store double* %6, double** %20, align 8
  store i32 %7, i32* %21, align 4
  store i32 %8, i32* %22, align 4
  store double* %9, double** %23, align 8
  store i32* %10, i32** %24, align 8
  store i32* %11, i32** %25, align 8
  store i32 %12, i32* %26, align 4
  %35 = load i32, i32* %22, align 4
  %36 = load i32, i32* %21, align 4
  %37 = sub nsw i32 %35, %36
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %27, align 4
  store i32 1, i32* %29, align 4
  br label %39

; <label>:39:                                     ; preds = %52, %13
  %40 = load i32, i32* %29, align 4
  %41 = load i32, i32* %17, align 4
  %42 = icmp sle i32 %40, %41
  br i1 %42, label %43, label %55

; <label>:43:                                     ; preds = %39
  %44 = load i32*, i32** %16, align 8
  %45 = load i32, i32* %29, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32* %44, i64 %46
  store i32 0, i32* %47, align 4
  %48 = load i32*, i32** %24, align 8
  %49 = load i32, i32* %29, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32* %48, i64 %50
  store i32 0, i32* %51, align 4
  br label %52

; <label>:52:                                     ; preds = %43
  %53 = load i32, i32* %29, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %29, align 4
  br label %39

; <label>:55:                                     ; preds = %39
  %56 = load i32*, i32** %16, align 8
  %57 = load i32, i32* %17, align 4
  %58 = add nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32* %56, i64 %59
  store i32 0, i32* %60, align 4
  store i32 1, i32* %31, align 4
  br label %61

; <label>:61:                                     ; preds = %85, %55
  %62 = load i32, i32* %31, align 4
  %63 = load i32, i32* %26, align 4
  %64 = icmp sle i32 %62, %63
  br i1 %64, label %65, label %88

; <label>:65:                                     ; preds = %61
  %66 = load i32*, i32** %18, align 8
  %67 = load i32, i32* %31, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32* %66, i64 %68
  %70 = load i32, i32* %69, align 4
  %71 = load i32, i32* %21, align 4
  %72 = sub nsw i32 %70, %71
  %73 = add nsw i32 %72, 1
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %29, align 4
  %75 = load i32*, i32** %16, align 8
  %76 = load i32, i32* %29, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32* %75, i64 %77
  %79 = load i32, i32* %78, align 4
  %80 = add nsw i32 %79, 1
  %81 = load i32*, i32** %16, align 8
  %82 = load i32, i32* %29, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32* %81, i64 %83
  store i32 %80, i32* %84, align 4
  br label %85

; <label>:85:                                     ; preds = %65
  %86 = load i32, i32* %31, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %31, align 4
  br label %61

; <label>:88:                                     ; preds = %61
  %89 = load i32*, i32** %16, align 8
  %90 = getelementptr inbounds i32, i32* %89, i64 1
  store i32 1, i32* %90, align 4
  store i32 2, i32* %29, align 4
  br label %91

; <label>:91:                                     ; preds = %113, %88
  %92 = load i32, i32* %29, align 4
  %93 = load i32, i32* %27, align 4
  %94 = add nsw i32 %93, 1
  %95 = icmp sle i32 %92, %94
  br i1 %95, label %96, label %116

; <label>:96:                                     ; preds = %91
  %97 = load i32*, i32** %16, align 8
  %98 = load i32, i32* %29, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32* %97, i64 %99
  %101 = load i32, i32* %100, align 4
  %102 = load i32*, i32** %16, align 8
  %103 = load i32, i32* %29, align 4
  %104 = sub nsw i32 %103, 1
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %102, i64 %105
  %107 = load i32, i32* %106, align 4
  %108 = add nsw i32 %101, %107
  %109 = load i32*, i32** %16, align 8
  %110 = load i32, i32* %29, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32* %109, i64 %111
  store i32 %108, i32* %112, align 4
  br label %113

; <label>:113:                                    ; preds = %96
  %114 = load i32, i32* %29, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %29, align 4
  br label %91

; <label>:116:                                    ; preds = %91
  store i32 0, i32* %29, align 4
  br label %117

; <label>:117:                                    ; preds = %147, %116
  %118 = load i32, i32* %29, align 4
  %119 = load i32, i32* %27, align 4
  %120 = sub nsw i32 %119, 1
  %121 = icmp sle i32 %118, %120
  br i1 %121, label %122, label %150

; <label>:122:                                    ; preds = %117
  %123 = load i32*, i32** %16, align 8
  %124 = load i32, i32* %29, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32* %123, i64 %125
  %127 = load i32, i32* %126, align 4
  store i32 %127, i32* %32, align 4
  br label %128

; <label>:128:                                    ; preds = %143, %122
  %129 = load i32, i32* %32, align 4
  %130 = load i32*, i32** %16, align 8
  %131 = load i32, i32* %29, align 4
  %132 = add nsw i32 %131, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32* %130, i64 %133
  %135 = load i32, i32* %134, align 4
  %136 = sub nsw i32 %135, 1
  %137 = icmp sle i32 %129, %136
  br i1 %137, label %138, label %146

; <label>:138:                                    ; preds = %128
  %139 = load double*, double** %14, align 8
  %140 = load i32, i32* %32, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds double, double* %139, i64 %141
  store double 0.000000e+00, double* %142, align 8
  br label %143

; <label>:143:                                    ; preds = %138
  %144 = load i32, i32* %32, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* %32, align 4
  br label %128

; <label>:146:                                    ; preds = %128
  br label %147

; <label>:147:                                    ; preds = %146
  %148 = load i32, i32* %29, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %29, align 4
  br label %117

; <label>:150:                                    ; preds = %117
  store i32 1, i32* %31, align 4
  br label %151

; <label>:151:                                    ; preds = %197, %150
  %152 = load i32, i32* %31, align 4
  %153 = load i32, i32* %26, align 4
  %154 = icmp sle i32 %152, %153
  br i1 %154, label %155, label %200

; <label>:155:                                    ; preds = %151
  %156 = load i32*, i32** %18, align 8
  %157 = load i32, i32* %31, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32* %156, i64 %158
  %160 = load i32, i32* %159, align 4
  %161 = load i32, i32* %21, align 4
  %162 = sub nsw i32 %160, %161
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %29, align 4
  %164 = load i32*, i32** %16, align 8
  %165 = load i32, i32* %29, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32* %164, i64 %166
  %168 = load i32, i32* %167, align 4
  store i32 %168, i32* %32, align 4
  %169 = load double*, double** %20, align 8
  %170 = load i32, i32* %31, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds double, double* %169, i64 %171
  %173 = load double, double* %172, align 8
  %174 = load double*, double** %14, align 8
  %175 = load i32, i32* %32, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds double, double* %174, i64 %176
  store double %173, double* %177, align 8
  %178 = load i32*, i32** %19, align 8
  %179 = load i32, i32* %31, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i32, i32* %178, i64 %180
  %182 = load i32, i32* %181, align 4
  %183 = load i32*, i32** %15, align 8
  %184 = load i32, i32* %32, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32* %183, i64 %185
  store i32 %182, i32* %186, align 4
  %187 = load i32*, i32** %16, align 8
  %188 = load i32, i32* %29, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i32, i32* %187, i64 %189
  %191 = load i32, i32* %190, align 4
  %192 = add nsw i32 %191, 1
  %193 = load i32*, i32** %16, align 8
  %194 = load i32, i32* %29, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32* %193, i64 %195
  store i32 %192, i32* %196, align 4
  br label %197

; <label>:197:                                    ; preds = %155
  %198 = load i32, i32* %31, align 4
  %199 = add nsw i32 %198, 1
  store i32 %199, i32* %31, align 4
  br label %151

; <label>:200:                                    ; preds = %151
  %201 = load i32, i32* %27, align 4
  store i32 %201, i32* %29, align 4
  br label %202

; <label>:202:                                    ; preds = %216, %200
  %203 = load i32, i32* %29, align 4
  %204 = icmp sge i32 %203, 1
  br i1 %204, label %205, label %219

; <label>:205:                                    ; preds = %202
  %206 = load i32*, i32** %16, align 8
  %207 = load i32, i32* %29, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i32, i32* %206, i64 %208
  %210 = load i32, i32* %209, align 4
  %211 = load i32*, i32** %16, align 8
  %212 = load i32, i32* %29, align 4
  %213 = add nsw i32 %212, 1
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32* %211, i64 %214
  store i32 %210, i32* %215, align 4
  br label %216

; <label>:216:                                    ; preds = %205
  %217 = load i32, i32* %29, align 4
  %218 = add nsw i32 %217, -1
  store i32 %218, i32* %29, align 4
  br label %202

; <label>:219:                                    ; preds = %202
  %220 = load i32*, i32** %16, align 8
  %221 = getelementptr inbounds i32, i32* %220, i64 1
  store i32 1, i32* %221, align 4
  store i32 0, i32* %31, align 4
  store i32 1, i32* %28, align 4
  br label %222

; <label>:222:                                    ; preds = %235, %219
  %223 = load i32, i32* %28, align 4
  %224 = load i32, i32* %17, align 4
  %225 = icmp sle i32 %223, %224
  br i1 %225, label %226, label %238

; <label>:226:                                    ; preds = %222
  %227 = load double*, double** %23, align 8
  %228 = load i32, i32* %28, align 4
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds double, double* %227, i64 %229
  store double 0.000000e+00, double* %230, align 8
  %231 = load i32*, i32** %24, align 8
  %232 = load i32, i32* %28, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i32, i32* %231, i64 %233
  store i32 0, i32* %234, align 4
  br label %235

; <label>:235:                                    ; preds = %226
  %236 = load i32, i32* %28, align 4
  %237 = add nsw i32 %236, 1
  store i32 %237, i32* %28, align 4
  br label %222

; <label>:238:                                    ; preds = %222
  %239 = load i32*, i32** %16, align 8
  %240 = getelementptr inbounds i32, i32* %239, i64 1
  %241 = load i32, i32* %240, align 4
  store i32 %241, i32* %30, align 4
  store i32 1, i32* %29, align 4
  br label %242

; <label>:242:                                    ; preds = %367, %238
  %243 = load i32, i32* %29, align 4
  %244 = load i32, i32* %27, align 4
  %245 = icmp sle i32 %243, %244
  br i1 %245, label %246, label %370

; <label>:246:                                    ; preds = %242
  store i32 0, i32* %33, align 4
  %247 = load i32, i32* %30, align 4
  store i32 %247, i32* %32, align 4
  br label %248

; <label>:248:                                    ; preds = %304, %246
  %249 = load i32, i32* %32, align 4
  %250 = load i32*, i32** %16, align 8
  %251 = load i32, i32* %29, align 4
  %252 = add nsw i32 %251, 1
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds i32, i32* %250, i64 %253
  %255 = load i32, i32* %254, align 4
  %256 = icmp slt i32 %249, %255
  br i1 %256, label %257, label %307

; <label>:257:                                    ; preds = %248
  %258 = load i32*, i32** %15, align 8
  %259 = load i32, i32* %32, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i32, i32* %258, i64 %260
  %262 = load i32, i32* %261, align 4
  store i32 %262, i32* %28, align 4
  %263 = load double*, double** %23, align 8
  %264 = load i32, i32* %28, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds double, double* %263, i64 %265
  %267 = load double, double* %266, align 8
  %268 = load double*, double** %14, align 8
  %269 = load i32, i32* %32, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds double, double* %268, i64 %270
  %272 = load double, double* %271, align 8
  %273 = fadd double %267, %272
  %274 = load double*, double** %23, align 8
  %275 = load i32, i32* %28, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds double, double* %274, i64 %276
  store double %273, double* %277, align 8
  %278 = load i32*, i32** %24, align 8
  %279 = load i32, i32* %28, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i32, i32* %278, i64 %280
  %282 = load i32, i32* %281, align 4
  %283 = icmp eq i32 %282, 0
  br i1 %283, label %284, label %303

; <label>:284:                                    ; preds = %257
  %285 = load double*, double** %23, align 8
  %286 = load i32, i32* %28, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds double, double* %285, i64 %287
  %289 = load double, double* %288, align 8
  %290 = fcmp une double %289, 0.000000e+00
  br i1 %290, label %291, label %303

; <label>:291:                                    ; preds = %284
  %292 = load i32*, i32** %24, align 8
  %293 = load i32, i32* %28, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds i32, i32* %292, i64 %294
  store i32 1, i32* %295, align 4
  %296 = load i32, i32* %33, align 4
  %297 = add nsw i32 %296, 1
  store i32 %297, i32* %33, align 4
  %298 = load i32, i32* %28, align 4
  %299 = load i32*, i32** %25, align 8
  %300 = load i32, i32* %33, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i32, i32* %299, i64 %301
  store i32 %298, i32* %302, align 4
  br label %303

; <label>:303:                                    ; preds = %291, %284, %257
  br label %304

; <label>:304:                                    ; preds = %303
  %305 = load i32, i32* %32, align 4
  %306 = add nsw i32 %305, 1
  store i32 %306, i32* %32, align 4
  br label %248

; <label>:307:                                    ; preds = %248
  store i32 1, i32* %32, align 4
  br label %308

; <label>:308:                                    ; preds = %347, %307
  %309 = load i32, i32* %32, align 4
  %310 = load i32, i32* %33, align 4
  %311 = icmp sle i32 %309, %310
  br i1 %311, label %312, label %350

; <label>:312:                                    ; preds = %308
  %313 = load i32*, i32** %25, align 8
  %314 = load i32, i32* %32, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i32, i32* %313, i64 %315
  %317 = load i32, i32* %316, align 4
  store i32 %317, i32* %28, align 4
  %318 = load i32*, i32** %24, align 8
  %319 = load i32, i32* %28, align 4
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds i32, i32* %318, i64 %320
  store i32 0, i32* %321, align 4
  %322 = load double*, double** %23, align 8
  %323 = load i32, i32* %28, align 4
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds double, double* %322, i64 %324
  %326 = load double, double* %325, align 8
  store double %326, double* %34, align 8
  %327 = load double*, double** %23, align 8
  %328 = load i32, i32* %28, align 4
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds double, double* %327, i64 %329
  store double 0.000000e+00, double* %330, align 8
  %331 = load double, double* %34, align 8
  %332 = fcmp une double %331, 0.000000e+00
  br i1 %332, label %333, label %346

; <label>:333:                                    ; preds = %312
  %334 = load i32, i32* %31, align 4
  %335 = add nsw i32 %334, 1
  store i32 %335, i32* %31, align 4
  %336 = load double, double* %34, align 8
  %337 = load double*, double** %14, align 8
  %338 = load i32, i32* %31, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds double, double* %337, i64 %339
  store double %336, double* %340, align 8
  %341 = load i32, i32* %28, align 4
  %342 = load i32*, i32** %15, align 8
  %343 = load i32, i32* %31, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds i32, i32* %342, i64 %344
  store i32 %341, i32* %345, align 4
  br label %346

; <label>:346:                                    ; preds = %333, %312
  br label %347

; <label>:347:                                    ; preds = %346
  %348 = load i32, i32* %32, align 4
  %349 = add nsw i32 %348, 1
  store i32 %349, i32* %32, align 4
  br label %308

; <label>:350:                                    ; preds = %308
  %351 = load i32*, i32** %16, align 8
  %352 = load i32, i32* %29, align 4
  %353 = add nsw i32 %352, 1
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds i32, i32* %351, i64 %354
  %356 = load i32, i32* %355, align 4
  store i32 %356, i32* %30, align 4
  %357 = load i32, i32* %31, align 4
  %358 = load i32*, i32** %16, align 8
  %359 = getelementptr inbounds i32, i32* %358, i64 1
  %360 = load i32, i32* %359, align 4
  %361 = add nsw i32 %357, %360
  %362 = load i32*, i32** %16, align 8
  %363 = load i32, i32* %29, align 4
  %364 = add nsw i32 %363, 1
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i32, i32* %362, i64 %365
  store i32 %361, i32* %366, align 4
  br label %367

; <label>:367:                                    ; preds = %350
  %368 = load i32, i32* %29, align 4
  %369 = add nsw i32 %368, 1
  store i32 %369, i32* %29, align 4
  br label %242

; <label>:370:                                    ; preds = %242
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @icnvrt(double, i32) #0 {
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  store double %0, double* %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = sitofp i32 %5 to double
  %7 = load double, double* %3, align 8
  %8 = fmul double %6, %7
  %9 = fptosi double %8 to i32
  ret i32 %9
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (tags/RELEASE_601/final)"}

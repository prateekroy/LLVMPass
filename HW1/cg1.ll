; ModuleID = 'cg.c'
source_filename = "cg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@firstrow = internal unnamed_addr global i1 false, align 4
@lastrow = internal unnamed_addr global i1 false, align 4
@firstcol = internal unnamed_addr global i1 false, align 4
@lastcol = internal unnamed_addr global i1 false, align 4
@.str.1 = private unnamed_addr constant [13 x i8] c" Size: %10d\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c" Iterations: %5d\0A\00", align 1
@naa = internal unnamed_addr global i1 false, align 4
@nzz = internal unnamed_addr global i1 false, align 4
@tran = internal global double 0.000000e+00, align 8
@amult = internal unnamed_addr global double 0.000000e+00, align 8
@a = internal unnamed_addr global [2198001 x double] zeroinitializer, align 16
@colidx = internal global [2198001 x i32] zeroinitializer, align 16
@rowstr = internal unnamed_addr global [14002 x i32] zeroinitializer, align 16
@arow = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@acol = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@aelt = internal unnamed_addr global [2198001 x double] zeroinitializer, align 16
@v = internal unnamed_addr global [14002 x double] zeroinitializer, align 16
@iv = internal global [28002 x i32] zeroinitializer, align 16
@x = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@q = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@z = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@r = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@p = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [30 x i8] c"    %5d       %20.14e%20.13e\0A\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c" Zeta is    %20.12e\0A\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c" Error is   %20.12e\0A\00", align 1
@.str.10 = private unnamed_addr constant [30 x i8] c" Zeta                %20.12e\0A\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c" The correct zeta is %20.12e\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"CG\00", align 1
@.str.15 = private unnamed_addr constant [25 x i8] c"          floating point\00", align 1
@.str.16 = private unnamed_addr constant [15 x i8] c"3.0 structured\00", align 1
@.str.17 = private unnamed_addr constant [12 x i8] c"27 Sep 2018\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"clang\00", align 1
@.str.19 = private unnamed_addr constant [4 x i8] c"-lm\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"-I../common\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"-O1 \00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"(none)\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"randdp\00", align 1
@conj_grad.callcount = internal unnamed_addr global i32 0, align 4
@.str.25 = private unnamed_addr constant [22 x i8] c"nnza, nzmax = %d, %d\0A\00", align 1
@.str.26 = private unnamed_addr constant [13 x i8] c"iouter = %d\0A\00", align 1
@str = private unnamed_addr constant [74 x i8] c"\0A\0A NAS Parallel Benchmarks 3.0 structured OpenMP C version - CG Benchmark\00"
@str.27 = private unnamed_addr constant [21 x i8] c" Benchmark completed\00"
@str.28 = private unnamed_addr constant [21 x i8] c" VERIFICATION FAILED\00"
@str.29 = private unnamed_addr constant [25 x i8] c" VERIFICATION SUCCESSFUL\00"
@str.30 = private unnamed_addr constant [50 x i8] c"   iteration           ||r||                 zeta\00"
@str.31 = private unnamed_addr constant [44 x i8] c"Space for matrix elements exceeded in makea\00"
@str.32 = private unnamed_addr constant [44 x i8] c"Space for matrix elements exceeded in makea\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #8
  store i1 true, i1* @firstrow, align 4
  store i1 true, i1* @lastrow, align 4
  store i1 true, i1* @firstcol, align 4
  store i1 true, i1* @lastcol, align 4
  %5 = tail call i32 @puts(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @str, i64 0, i64 0))
  %6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 14000)
  %7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i32 15)
  store i1 true, i1* @naa, align 4
  store i1 true, i1* @nzz, align 4
  store double 0x41B2B9B0A1000000, double* @tran, align 8, !tbaa !2
  store double 0x41D2309CE5400000, double* @amult, align 8, !tbaa !2
  %8 = tail call double @randlc(double* nonnull @tran, double 0x41D2309CE5400000) #8
  %9 = load i1, i1* @naa, align 4
  %10 = select i1 %9, i32 14000, i32 0
  %11 = load i1, i1* @nzz, align 4
  %12 = select i1 %11, i32 2198000, i32 0
  %13 = load i1, i1* @firstrow, align 4
  %14 = zext i1 %13 to i32
  %15 = load i1, i1* @lastrow, align 4
  %16 = select i1 %15, i32 14000, i32 0
  %17 = load i1, i1* @firstcol, align 4
  %18 = zext i1 %17 to i32
  %19 = load i1, i1* @lastcol, align 4
  %20 = select i1 %19, i32 14000, i32 0
  tail call fastcc void @makea(i32 %10, i32 %12, i32 %14, i32 %16, i32 %18, i32 %20)
  %21 = load i1, i1* @lastrow, align 4
  %22 = load i1, i1* @firstrow, align 4
  %23 = sext i1 %22 to i32
  %24 = select i1 %21, i32 14001, i32 1
  %25 = add nsw i32 %24, %23
  %26 = icmp slt i32 %25, 1
  br i1 %26, label %57, label %27

; <label>:27:                                     ; preds = %2
  %28 = load i1, i1* @firstcol, align 4
  %29 = sext i1 %28 to i32
  %30 = load i1, i1* @lastrow, align 4
  %31 = load i1, i1* @firstrow, align 4
  %32 = sext i1 %31 to i64
  %33 = select i1 %30, i64 14001, i64 1
  %34 = add nsw i64 %33, %32
  br label %35

; <label>:35:                                     ; preds = %55, %27
  %36 = phi i64 [ %39, %55 ], [ 1, %27 ]
  %37 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !6
  %39 = add nuw nsw i64 %36, 1
  %40 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %39
  %41 = load i32, i32* %40, align 4, !tbaa !6
  %42 = icmp slt i32 %38, %41
  br i1 %42, label %43, label %55

; <label>:43:                                     ; preds = %35
  %44 = load i32, i32* %40, align 4, !tbaa !6
  %45 = sext i32 %38 to i64
  %46 = sext i32 %44 to i64
  br label %47

; <label>:47:                                     ; preds = %43, %47
  %48 = phi i64 [ %45, %43 ], [ %53, %47 ]
  %49 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %48
  %50 = load i32, i32* %49, align 4, !tbaa !6
  %51 = add i32 %50, 1
  %52 = add i32 %51, %29
  store i32 %52, i32* %49, align 4, !tbaa !6
  %53 = add nsw i64 %48, 1
  %54 = icmp slt i64 %53, %46
  br i1 %54, label %47, label %55

; <label>:55:                                     ; preds = %47, %35
  %56 = icmp slt i64 %36, %34
  br i1 %56, label %35, label %57

; <label>:57:                                     ; preds = %55, %2
  br label %58

; <label>:58:                                     ; preds = %57, %58
  %59 = phi i64 [ %61, %58 ], [ 1, %57 ]
  %60 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %59
  store double 1.000000e+00, double* %60, align 8, !tbaa !2
  %61 = add nuw nsw i64 %59, 1
  %62 = icmp eq i64 %61, 14002
  br i1 %62, label %63, label %58

; <label>:63:                                     ; preds = %58
  %64 = load i1, i1* @lastcol, align 4
  %65 = load i1, i1* @firstcol, align 4
  %66 = sext i1 %65 to i32
  %67 = select i1 %64, i32 14001, i32 1
  %68 = add nsw i32 %67, %66
  %69 = icmp slt i32 %68, 1
  br i1 %69, label %92, label %70

; <label>:70:                                     ; preds = %63
  %71 = load i1, i1* @lastcol, align 4
  %72 = load i1, i1* @firstcol, align 4
  %73 = sext i1 %72 to i32
  %74 = select i1 %71, i32 14001, i32 1
  %75 = add nsw i32 %74, %73
  %76 = icmp sgt i32 %75, 1
  %77 = select i1 %76, i32 %75, i32 1
  %78 = zext i32 %77 to i64
  %79 = shl nuw nsw i64 %78, 3
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i64 0, i64 1) to i8*), i8 0, i64 %79, i32 8, i1 false)
  %80 = icmp sgt i32 %75, 1
  %81 = select i1 %80, i32 %75, i32 1
  %82 = zext i32 %81 to i64
  %83 = shl nuw nsw i64 %82, 3
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i64 0, i64 1) to i8*), i8 0, i64 %83, i32 8, i1 false)
  %84 = icmp sgt i32 %75, 1
  %85 = select i1 %84, i32 %75, i32 1
  %86 = zext i32 %85 to i64
  %87 = shl nuw nsw i64 %86, 3
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i64 0, i64 1) to i8*), i8 0, i64 %87, i32 8, i1 false)
  %88 = icmp sgt i32 %75, 1
  %89 = select i1 %88, i32 %75, i32 1
  %90 = zext i32 %89 to i64
  %91 = shl nuw nsw i64 %90, 3
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i64 0, i64 1) to i8*), i8 0, i64 %91, i32 8, i1 false)
  br label %92

; <label>:92:                                     ; preds = %63, %70
  call fastcc void @conj_grad(double* nonnull %3)
  %93 = load i1, i1* @lastcol, align 4
  %94 = load i1, i1* @firstcol, align 4
  %95 = sext i1 %94 to i32
  %96 = select i1 %93, i32 14001, i32 1
  %97 = add nsw i32 %96, %95
  %98 = icmp slt i32 %97, 1
  br i1 %98, label %114, label %99

; <label>:99:                                     ; preds = %92
  %100 = load i1, i1* @lastcol, align 4
  %101 = load i1, i1* @firstcol, align 4
  %102 = sext i1 %101 to i64
  %103 = select i1 %100, i64 14001, i64 1
  %104 = add nsw i64 %103, %102
  br label %105

; <label>:105:                                    ; preds = %105, %99
  %106 = phi i64 [ %112, %105 ], [ 1, %99 ]
  %107 = phi double [ %111, %105 ], [ 0.000000e+00, %99 ]
  %108 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %106
  %109 = load double, double* %108, align 8, !tbaa !2
  %110 = fmul double %109, %109
  %111 = fadd double %107, %110
  %112 = add nuw nsw i64 %106, 1
  %113 = icmp slt i64 %106, %104
  br i1 %113, label %105, label %114

; <label>:114:                                    ; preds = %105, %92
  %115 = phi double [ 0.000000e+00, %92 ], [ %111, %105 ]
  %116 = tail call double @sqrt(double %115) #8
  %117 = fdiv double 1.000000e+00, %116
  %118 = load i1, i1* @lastcol, align 4
  %119 = load i1, i1* @firstcol, align 4
  %120 = sext i1 %119 to i32
  %121 = select i1 %118, i32 14001, i32 1
  %122 = add nsw i32 %121, %120
  %123 = icmp slt i32 %122, 1
  br i1 %123, label %138, label %124

; <label>:124:                                    ; preds = %114
  %125 = load i1, i1* @lastcol, align 4
  %126 = load i1, i1* @firstcol, align 4
  %127 = sext i1 %126 to i64
  %128 = select i1 %125, i64 14001, i64 1
  %129 = add nsw i64 %128, %127
  br label %130

; <label>:130:                                    ; preds = %130, %124
  %131 = phi i64 [ %136, %130 ], [ 1, %124 ]
  %132 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %131
  %133 = load double, double* %132, align 8, !tbaa !2
  %134 = fmul double %117, %133
  %135 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %131
  store double %134, double* %135, align 8, !tbaa !2
  %136 = add nuw nsw i64 %131, 1
  %137 = icmp slt i64 %131, %129
  br i1 %137, label %130, label %138

; <label>:138:                                    ; preds = %130, %114
  br label %139

; <label>:139:                                    ; preds = %138, %139
  %140 = phi i64 [ %142, %139 ], [ 1, %138 ]
  %141 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %140
  store double 1.000000e+00, double* %141, align 8, !tbaa !2
  %142 = add nuw nsw i64 %140, 1
  %143 = icmp eq i64 %142, 14002
  br i1 %143, label %144, label %139

; <label>:144:                                    ; preds = %139
  tail call void @timer_clear(i32 1) #8
  tail call void @timer_start(i32 1) #8
  br label %145

; <label>:145:                                    ; preds = %206, %144
  %146 = phi i32 [ 1, %144 ], [ %207, %206 ]
  call fastcc void @conj_grad(double* nonnull %3)
  %147 = load i1, i1* @lastcol, align 4
  %148 = load i1, i1* @firstcol, align 4
  %149 = sext i1 %148 to i32
  %150 = select i1 %147, i32 14001, i32 1
  %151 = add nsw i32 %150, %149
  %152 = icmp slt i32 %151, 1
  br i1 %152, label %173, label %153

; <label>:153:                                    ; preds = %145
  %154 = load i1, i1* @lastcol, align 4
  %155 = load i1, i1* @firstcol, align 4
  %156 = sext i1 %155 to i64
  %157 = select i1 %154, i64 14001, i64 1
  %158 = add nsw i64 %157, %156
  br label %159

; <label>:159:                                    ; preds = %159, %153
  %160 = phi i64 [ %171, %159 ], [ 1, %153 ]
  %161 = phi double [ %170, %159 ], [ 0.000000e+00, %153 ]
  %162 = phi double [ %168, %159 ], [ 0.000000e+00, %153 ]
  %163 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %160
  %164 = load double, double* %163, align 8, !tbaa !2
  %165 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %160
  %166 = load double, double* %165, align 8, !tbaa !2
  %167 = fmul double %164, %166
  %168 = fadd double %162, %167
  %169 = fmul double %166, %166
  %170 = fadd double %161, %169
  %171 = add nuw nsw i64 %160, 1
  %172 = icmp slt i64 %160, %158
  br i1 %172, label %159, label %173

; <label>:173:                                    ; preds = %159, %145
  %174 = phi double [ 0.000000e+00, %145 ], [ %168, %159 ]
  %175 = phi double [ 0.000000e+00, %145 ], [ %170, %159 ]
  %176 = tail call double @sqrt(double %175) #8
  %177 = fdiv double 1.000000e+00, %176
  %178 = fdiv double 1.000000e+00, %174
  %179 = fadd double %178, 2.000000e+01
  %180 = icmp eq i32 %146, 1
  br i1 %180, label %181, label %183

; <label>:181:                                    ; preds = %173
  %182 = tail call i32 @puts(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @str.30, i64 0, i64 0))
  br label %183

; <label>:183:                                    ; preds = %181, %173
  %184 = load double, double* %3, align 8, !tbaa !2
  %185 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i32 %146, double %184, double %179)
  %186 = load i1, i1* @lastcol, align 4
  %187 = load i1, i1* @firstcol, align 4
  %188 = sext i1 %187 to i32
  %189 = select i1 %186, i32 14001, i32 1
  %190 = add nsw i32 %189, %188
  %191 = icmp slt i32 %190, 1
  br i1 %191, label %206, label %192

; <label>:192:                                    ; preds = %183
  %193 = load i1, i1* @lastcol, align 4
  %194 = load i1, i1* @firstcol, align 4
  %195 = sext i1 %194 to i64
  %196 = select i1 %193, i64 14001, i64 1
  %197 = add nsw i64 %196, %195
  br label %198

; <label>:198:                                    ; preds = %198, %192
  %199 = phi i64 [ %204, %198 ], [ 1, %192 ]
  %200 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %199
  %201 = load double, double* %200, align 8, !tbaa !2
  %202 = fmul double %177, %201
  %203 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %199
  store double %202, double* %203, align 8, !tbaa !2
  %204 = add nuw nsw i64 %199, 1
  %205 = icmp slt i64 %199, %197
  br i1 %205, label %198, label %206

; <label>:206:                                    ; preds = %198, %183
  %207 = add nuw nsw i32 %146, 1
  %208 = icmp eq i32 %207, 16
  br i1 %208, label %209, label %145

; <label>:209:                                    ; preds = %206
  tail call void @timer_stop(i32 1) #8
  %210 = tail call double @timer_read(i32 1) #8
  %211 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.27, i64 0, i64 0))
  %212 = fadd double %179, 0xC031215715A1D8EC
  %213 = tail call double @llvm.fabs.f64(double %212)
  %214 = fcmp ugt double %213, 1.000000e-10
  br i1 %214, label %219, label %215

; <label>:215:                                    ; preds = %209
  %216 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.29, i64 0, i64 0))
  %217 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), double %179)
  %218 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i64 0, i64 0), double %212)
  br label %223

; <label>:219:                                    ; preds = %209
  %220 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.28, i64 0, i64 0))
  %221 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i64 0, i64 0), double %179)
  %222 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), double 0x4031215715A1D8EC)
  br label %223

; <label>:223:                                    ; preds = %215, %219
  %224 = phi i32 [ 1, %215 ], [ 0, %219 ]
  %225 = fcmp une double %210, 0.000000e+00
  br i1 %225, label %226, label %229

; <label>:226:                                    ; preds = %223
  %227 = fdiv double 1.496460e+09, %210
  %228 = fdiv double %227, 1.000000e+06
  br label %229

; <label>:229:                                    ; preds = %223, %226
  %230 = phi double [ %228, %226 ], [ 0.000000e+00, %223 ]
  tail call void @c_print_results(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i64 0, i64 0), i8 signext 65, i32 14000, i32 0, i32 0, i32 15, i32 1, double %210, double %230, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.15, i64 0, i64 0), i32 %224, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.23, i64 0, i64 0)) #8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #8
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare double @randlc(double*, double) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @makea(i32, i32, i32, i32, i32, i32) unnamed_addr #0 {
  %7 = alloca i32, align 4
  %8 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #8
  %9 = sitofp i32 %0 to double
  %10 = fdiv double 1.000000e+00, %9
  %11 = tail call double @pow(double 1.000000e-01, double %10) #8
  %12 = icmp slt i32 %0, 1
  br i1 %12, label %83, label %13

; <label>:13:                                     ; preds = %6
  %14 = sext i32 %0 to i64
  %15 = add nsw i64 %14, 1
  %16 = getelementptr [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %15
  %17 = bitcast i32* %16 to i8*
  %18 = zext i32 %0 to i64
  %19 = shl nuw nsw i64 %18, 2
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 %19, i32 4, i1 false)
  %20 = sext i32 %0 to i64
  %21 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %20
  br label %22

; <label>:22:                                     ; preds = %78, %13
  %23 = phi i32 [ 0, %13 ], [ %79, %78 ]
  %24 = phi i32 [ 1, %13 ], [ %81, %78 ]
  %25 = phi double [ 1.000000e+00, %13 ], [ %80, %78 ]
  store i32 11, i32* %7, align 4, !tbaa !6
  tail call fastcc void @sprnvc(i32 %0, i32* nonnull %21)
  call fastcc void @vecset(i32* nonnull %7, i32 %24)
  %26 = load i32, i32* %7, align 4, !tbaa !6
  %27 = icmp slt i32 %26, 1
  br i1 %27, label %78, label %28

; <label>:28:                                     ; preds = %22
  %29 = load i32, i32* %7, align 4
  %30 = sext i32 %29 to i64
  br label %31

; <label>:31:                                     ; preds = %74, %28
  %32 = phi i64 [ %76, %74 ], [ 1, %28 ]
  %33 = phi i32 [ %29, %74 ], [ %26, %28 ]
  %34 = phi i32 [ %75, %74 ], [ %23, %28 ]
  %35 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %32
  %36 = load i32, i32* %35, align 4, !tbaa !6
  %37 = icmp slt i32 %36, %4
  %38 = icmp sgt i32 %36, %5
  %39 = or i1 %37, %38
  br i1 %39, label %74, label %40

; <label>:40:                                     ; preds = %31
  %41 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %32
  %42 = load double, double* %41, align 8, !tbaa !2
  %43 = fmul double %25, %42
  %44 = icmp slt i32 %33, 1
  br i1 %44, label %74, label %45

; <label>:45:                                     ; preds = %40
  %46 = sext i32 %33 to i64
  br label %47

; <label>:47:                                     ; preds = %70, %45
  %48 = phi i64 [ %72, %70 ], [ 1, %45 ]
  %49 = phi i32 [ %71, %70 ], [ %34, %45 ]
  %50 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %48
  %51 = load i32, i32* %50, align 4, !tbaa !6
  %52 = icmp slt i32 %51, %2
  %53 = icmp sgt i32 %51, %3
  %54 = or i1 %52, %53
  br i1 %54, label %70, label %55

; <label>:55:                                     ; preds = %47
  %56 = add nsw i32 %49, 1
  %57 = icmp slt i32 %49, %1
  br i1 %57, label %62, label %58

; <label>:58:                                     ; preds = %55
  %59 = tail call i32 @puts(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @str.32, i64 0, i64 0))
  %60 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), i32 %56, i32 %1)
  %61 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i64 0, i64 0), i32 %24)
  tail call void @exit(i32 1) #9
  unreachable

; <label>:62:                                     ; preds = %55
  %63 = sext i32 %56 to i64
  %64 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %63
  store i32 %36, i32* %64, align 4, !tbaa !6
  %65 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %63
  store i32 %51, i32* %65, align 4, !tbaa !6
  %66 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %48
  %67 = load double, double* %66, align 8, !tbaa !2
  %68 = fmul double %43, %67
  %69 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %63
  store double %68, double* %69, align 8, !tbaa !2
  br label %70

; <label>:70:                                     ; preds = %47, %62
  %71 = phi i32 [ %56, %62 ], [ %49, %47 ]
  %72 = add nuw nsw i64 %48, 1
  %73 = icmp slt i64 %48, %46
  br i1 %73, label %47, label %74

; <label>:74:                                     ; preds = %70, %40, %31
  %75 = phi i32 [ %34, %31 ], [ %34, %40 ], [ %71, %70 ]
  %76 = add nuw nsw i64 %32, 1
  %77 = icmp slt i64 %32, %30
  br i1 %77, label %31, label %78

; <label>:78:                                     ; preds = %74, %22
  %79 = phi i32 [ %23, %22 ], [ %75, %74 ]
  %80 = fmul double %11, %25
  %81 = add nuw nsw i32 %24, 1
  %82 = icmp slt i32 %24, %0
  br i1 %82, label %22, label %83

; <label>:83:                                     ; preds = %78, %6
  %84 = phi i32 [ 0, %6 ], [ %79, %78 ]
  %85 = icmp sgt i32 %2, %3
  br i1 %85, label %110, label %86

; <label>:86:                                     ; preds = %83
  br label %87

; <label>:87:                                     ; preds = %86, %106
  %88 = phi i32 [ %108, %106 ], [ %2, %86 ]
  %89 = phi i32 [ %107, %106 ], [ %84, %86 ]
  %90 = icmp slt i32 %88, %4
  %91 = icmp sgt i32 %88, %5
  %92 = or i1 %90, %91
  br i1 %92, label %106, label %93

; <label>:93:                                     ; preds = %87
  %94 = add nsw i32 %89, 1
  %95 = icmp slt i32 %89, %1
  br i1 %95, label %101, label %96

; <label>:96:                                     ; preds = %93
  %97 = add nsw i32 %88, %0
  %98 = tail call i32 @puts(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @str.31, i64 0, i64 0))
  %99 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), i32 %94, i32 %1)
  %100 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i64 0, i64 0), i32 %97)
  tail call void @exit(i32 1) #9
  unreachable

; <label>:101:                                    ; preds = %93
  %102 = sext i32 %94 to i64
  %103 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %102
  store i32 %88, i32* %103, align 4, !tbaa !6
  %104 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %102
  store i32 %88, i32* %104, align 4, !tbaa !6
  %105 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %102
  store double -1.990000e+01, double* %105, align 8, !tbaa !2
  br label %106

; <label>:106:                                    ; preds = %87, %101
  %107 = phi i32 [ %94, %101 ], [ %89, %87 ]
  %108 = add nsw i32 %88, 1
  %109 = icmp slt i32 %88, %3
  br i1 %109, label %87, label %110

; <label>:110:                                    ; preds = %106, %83
  %111 = phi i32 [ %84, %83 ], [ %107, %106 ]
  %112 = sext i32 %0 to i64
  %113 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %112
  tail call fastcc void @sparse(i32 %0, i32 %2, i32 %3, i32* nonnull %113, i32 %111)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #8
  ret void
}

; Function Attrs: nounwind uwtable
define internal fastcc void @conj_grad(double* nocapture) unnamed_addr #0 {
  %2 = load i1, i1* @naa, align 4
  %3 = select i1 %2, i32 14001, i32 1
  %4 = shl nuw nsw i32 %3, 3
  %5 = zext i32 %4 to i64
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i64 0, i64 1) to i8*), i8 0, i64 %5, i32 8, i1 false)
  %6 = shl nuw nsw i32 %3, 3
  %7 = zext i32 %6 to i64
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i64 0, i64 1) to i8*), i8 0, i64 %7, i32 8, i1 false)
  %8 = shl nuw nsw i32 %3, 3
  %9 = zext i32 %8 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i64 0, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 1) to i8*), i64 %9, i32 8, i1 false)
  %10 = shl nuw nsw i32 %3, 3
  %11 = zext i32 %10 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i64 0, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 1) to i8*), i64 %11, i32 8, i1 false)
  %12 = load i1, i1* @lastcol, align 4
  %13 = select i1 %12, i32 14000, i32 0
  %14 = load i1, i1* @firstcol, align 4
  %15 = zext i1 %14 to i32
  %16 = sub nsw i32 %13, %15
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %34, label %18

; <label>:18:                                     ; preds = %1
  %19 = load i1, i1* @lastcol, align 4
  %20 = select i1 %19, i32 14000, i32 0
  %21 = load i1, i1* @firstcol, align 4
  %22 = zext i1 %21 to i32
  %23 = sub nsw i32 %20, %22
  %24 = sext i32 %23 to i64
  br label %25

; <label>:25:                                     ; preds = %18, %25
  %26 = phi i64 [ 1, %18 ], [ %32, %25 ]
  %27 = phi double [ 0.000000e+00, %18 ], [ %31, %25 ]
  %28 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %26
  %29 = load double, double* %28, align 8, !tbaa !2
  %30 = fmul double %29, %29
  %31 = fadd double %27, %30
  %32 = add nuw nsw i64 %26, 1
  %33 = icmp sgt i64 %26, %24
  br i1 %33, label %34, label %25

; <label>:34:                                     ; preds = %25, %1
  %35 = phi double [ 0.000000e+00, %1 ], [ %31, %25 ]
  %36 = phi i32 [ %16, %1 ], [ %23, %25 ]
  %37 = load i1, i1* @lastrow, align 4
  %38 = load i1, i1* @firstrow, align 4
  %39 = sext i1 %38 to i32
  %40 = select i1 %37, i32 14001, i32 1
  %41 = add nsw i32 %40, %39
  %42 = icmp slt i32 %41, 1
  %43 = icmp slt i32 %36, 0
  %44 = load i1, i1* @lastrow, align 4
  %45 = load i1, i1* @firstrow, align 4
  %46 = sext i1 %45 to i64
  %47 = select i1 %44, i64 14001, i64 1
  %48 = add nsw i64 %47, %46
  %49 = icmp slt i32 %36, 0
  %50 = icmp slt i32 %36, 0
  %51 = load i32, i32* @conj_grad.callcount, align 4, !tbaa !6
  %52 = sext i32 %36 to i64
  %53 = sext i32 %36 to i64
  %54 = sext i32 %36 to i64
  br label %55

; <label>:55:                                     ; preds = %139, %34
  %56 = phi i32 [ 1, %34 ], [ %140, %139 ]
  %57 = phi double [ %35, %34 ], [ %126, %139 ]
  br i1 %42, label %89, label %58

; <label>:58:                                     ; preds = %55
  br label %59

; <label>:59:                                     ; preds = %58, %85
  %60 = phi i64 [ %63, %85 ], [ 1, %58 ]
  %61 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %60
  %62 = load i32, i32* %61, align 4, !tbaa !6
  %63 = add nuw nsw i64 %60, 1
  %64 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %63
  %65 = load i32, i32* %64, align 4, !tbaa !6
  %66 = icmp slt i32 %62, %65
  br i1 %66, label %67, label %85

; <label>:67:                                     ; preds = %59
  %68 = load i32, i32* %64, align 4, !tbaa !6
  %69 = sext i32 %62 to i64
  %70 = sext i32 %68 to i64
  br label %71

; <label>:71:                                     ; preds = %67, %71
  %72 = phi i64 [ %69, %67 ], [ %83, %71 ]
  %73 = phi double [ 0.000000e+00, %67 ], [ %82, %71 ]
  %74 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %72
  %75 = load double, double* %74, align 8, !tbaa !2
  %76 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %72
  %77 = load i32, i32* %76, align 4, !tbaa !6
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %78
  %80 = load double, double* %79, align 8, !tbaa !2
  %81 = fmul double %75, %80
  %82 = fadd double %73, %81
  %83 = add nsw i64 %72, 1
  %84 = icmp slt i64 %83, %70
  br i1 %84, label %71, label %85

; <label>:85:                                     ; preds = %71, %59
  %86 = phi double [ 0.000000e+00, %59 ], [ %82, %71 ]
  %87 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %60
  store double %86, double* %87, align 8, !tbaa !2
  %88 = icmp slt i64 %60, %48
  br i1 %88, label %59, label %89

; <label>:89:                                     ; preds = %85, %55
  br i1 %43, label %102, label %90

; <label>:90:                                     ; preds = %89
  br label %91

; <label>:91:                                     ; preds = %90, %91
  %92 = phi i64 [ %100, %91 ], [ 1, %90 ]
  %93 = phi double [ %99, %91 ], [ 0.000000e+00, %90 ]
  %94 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %92
  %95 = load double, double* %94, align 8, !tbaa !2
  %96 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %92
  %97 = load double, double* %96, align 8, !tbaa !2
  %98 = fmul double %95, %97
  %99 = fadd double %93, %98
  %100 = add nuw nsw i64 %92, 1
  %101 = icmp sgt i64 %92, %52
  br i1 %101, label %102, label %91

; <label>:102:                                    ; preds = %91, %89
  %103 = phi double [ 0.000000e+00, %89 ], [ %99, %91 ]
  %104 = fdiv double %57, %103
  br i1 %49, label %125, label %105

; <label>:105:                                    ; preds = %102
  br label %106

; <label>:106:                                    ; preds = %105, %106
  %107 = phi i64 [ %123, %106 ], [ 1, %105 ]
  %108 = phi double [ %122, %106 ], [ 0.000000e+00, %105 ]
  %109 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %107
  %110 = load double, double* %109, align 8, !tbaa !2
  %111 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %107
  %112 = load double, double* %111, align 8, !tbaa !2
  %113 = fmul double %104, %112
  %114 = fadd double %110, %113
  store double %114, double* %109, align 8, !tbaa !2
  %115 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %107
  %116 = load double, double* %115, align 8, !tbaa !2
  %117 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %107
  %118 = load double, double* %117, align 8, !tbaa !2
  %119 = fmul double %104, %118
  %120 = fsub double %116, %119
  store double %120, double* %115, align 8, !tbaa !2
  %121 = fmul double %120, %120
  %122 = fadd double %108, %121
  %123 = add nuw nsw i64 %107, 1
  %124 = icmp sgt i64 %107, %53
  br i1 %124, label %125, label %106

; <label>:125:                                    ; preds = %106, %102
  %126 = phi double [ 0.000000e+00, %102 ], [ %122, %106 ]
  %127 = fdiv double %126, %57
  br i1 %50, label %139, label %128

; <label>:128:                                    ; preds = %125
  br label %129

; <label>:129:                                    ; preds = %128, %129
  %130 = phi i64 [ %137, %129 ], [ 1, %128 ]
  %131 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %130
  %132 = load double, double* %131, align 8, !tbaa !2
  %133 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %130
  %134 = load double, double* %133, align 8, !tbaa !2
  %135 = fmul double %127, %134
  %136 = fadd double %132, %135
  store double %136, double* %133, align 8, !tbaa !2
  %137 = add nuw nsw i64 %130, 1
  %138 = icmp sgt i64 %130, %54
  br i1 %138, label %139, label %129

; <label>:139:                                    ; preds = %129, %125
  %140 = add nuw nsw i32 %56, 1
  %141 = icmp eq i32 %140, 26
  br i1 %141, label %142, label %55

; <label>:142:                                    ; preds = %139
  %143 = add i32 %51, 25
  store i32 %143, i32* @conj_grad.callcount, align 4, !tbaa !6
  %144 = load i1, i1* @lastrow, align 4
  %145 = load i1, i1* @firstrow, align 4
  %146 = sext i1 %145 to i32
  %147 = select i1 %144, i32 14001, i32 1
  %148 = add nsw i32 %147, %146
  %149 = icmp slt i32 %148, 1
  br i1 %149, label %186, label %150

; <label>:150:                                    ; preds = %142
  %151 = load i1, i1* @lastrow, align 4
  %152 = load i1, i1* @firstrow, align 4
  %153 = sext i1 %152 to i64
  %154 = select i1 %151, i64 14001, i64 1
  %155 = add nsw i64 %154, %153
  br label %156

; <label>:156:                                    ; preds = %182, %150
  %157 = phi i64 [ %160, %182 ], [ 1, %150 ]
  %158 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %157
  %159 = load i32, i32* %158, align 4, !tbaa !6
  %160 = add nuw nsw i64 %157, 1
  %161 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %160
  %162 = load i32, i32* %161, align 4, !tbaa !6
  %163 = icmp slt i32 %159, %162
  br i1 %163, label %164, label %182

; <label>:164:                                    ; preds = %156
  %165 = load i32, i32* %161, align 4, !tbaa !6
  %166 = sext i32 %159 to i64
  %167 = sext i32 %165 to i64
  br label %168

; <label>:168:                                    ; preds = %164, %168
  %169 = phi i64 [ %166, %164 ], [ %180, %168 ]
  %170 = phi double [ 0.000000e+00, %164 ], [ %179, %168 ]
  %171 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %169
  %172 = load double, double* %171, align 8, !tbaa !2
  %173 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %169
  %174 = load i32, i32* %173, align 4, !tbaa !6
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %175
  %177 = load double, double* %176, align 8, !tbaa !2
  %178 = fmul double %172, %177
  %179 = fadd double %170, %178
  %180 = add nsw i64 %169, 1
  %181 = icmp slt i64 %180, %167
  br i1 %181, label %168, label %182

; <label>:182:                                    ; preds = %168, %156
  %183 = phi double [ 0.000000e+00, %156 ], [ %179, %168 ]
  %184 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %157
  store double %183, double* %184, align 8, !tbaa !2
  %185 = icmp slt i64 %157, %155
  br i1 %185, label %156, label %186

; <label>:186:                                    ; preds = %182, %142
  %187 = icmp slt i32 %36, 0
  br i1 %187, label %202, label %188

; <label>:188:                                    ; preds = %186
  %189 = sext i32 %36 to i64
  br label %190

; <label>:190:                                    ; preds = %188, %190
  %191 = phi i64 [ 1, %188 ], [ %200, %190 ]
  %192 = phi double [ 0.000000e+00, %188 ], [ %199, %190 ]
  %193 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %191
  %194 = load double, double* %193, align 8, !tbaa !2
  %195 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %191
  %196 = load double, double* %195, align 8, !tbaa !2
  %197 = fsub double %194, %196
  %198 = fmul double %197, %197
  %199 = fadd double %192, %198
  %200 = add nuw nsw i64 %191, 1
  %201 = icmp sgt i64 %191, %189
  br i1 %201, label %202, label %190

; <label>:202:                                    ; preds = %190, %186
  %203 = phi double [ 0.000000e+00, %186 ], [ %199, %190 ]
  %204 = tail call double @sqrt(double %203) #8
  store double %204, double* %0, align 8, !tbaa !2
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare void @timer_clear(i32) local_unnamed_addr #3

declare void @timer_start(i32) local_unnamed_addr #3

declare void @timer_stop(i32) local_unnamed_addr #3

declare double @timer_read(i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #4

declare void @c_print_results(i8*, i8 signext, i32, i32, i32, i32, i32, double, double, i8*, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare double @pow(double, double) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define internal fastcc void @sprnvc(i32, i32* nocapture) unnamed_addr #0 {
  br label %3

; <label>:3:                                      ; preds = %3, %2
  %4 = phi i32 [ 1, %2 ], [ %5, %3 ]
  %5 = shl nsw i32 %4, 1
  %6 = icmp slt i32 %5, %0
  br i1 %6, label %3, label %7

; <label>:7:                                      ; preds = %3
  br label %8

; <label>:8:                                      ; preds = %7, %32
  %9 = phi i32 [ %34, %32 ], [ 0, %7 ]
  %10 = phi i32 [ %33, %32 ], [ 0, %7 ]
  br label %11

; <label>:11:                                     ; preds = %11, %8
  %12 = load double, double* @amult, align 8, !tbaa !2
  %13 = tail call double @randlc(double* nonnull @tran, double %12) #8
  %14 = load double, double* @amult, align 8, !tbaa !2
  %15 = tail call double @randlc(double* nonnull @tran, double %14) #8
  %16 = tail call fastcc i32 @icnvrt(double %15, i32 %5)
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %11

; <label>:18:                                     ; preds = %11
  %19 = add nsw i32 %16, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32* %1, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !6
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %32

; <label>:24:                                     ; preds = %18
  store i32 1, i32* %21, align 4, !tbaa !6
  %25 = add nsw i32 %9, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %26
  store i32 %19, i32* %27, align 4, !tbaa !6
  %28 = add nsw i32 %10, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %29
  store double %13, double* %30, align 8, !tbaa !2
  %31 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %29
  store i32 %19, i32* %31, align 4, !tbaa !6
  br label %32

; <label>:32:                                     ; preds = %24, %18
  %33 = phi i32 [ %28, %24 ], [ %10, %18 ]
  %34 = phi i32 [ %25, %24 ], [ %9, %18 ]
  %35 = icmp slt i32 %33, 11
  br i1 %35, label %8, label %36

; <label>:36:                                     ; preds = %32
  %37 = icmp slt i32 %34, 1
  br i1 %37, label %49, label %38

; <label>:38:                                     ; preds = %36
  %39 = add i32 %34, 1
  %40 = zext i32 %39 to i64
  br label %41

; <label>:41:                                     ; preds = %41, %38
  %42 = phi i64 [ %47, %41 ], [ 1, %38 ]
  %43 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %42
  %44 = load i32, i32* %43, align 4, !tbaa !6
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %1, i64 %45
  store i32 0, i32* %46, align 4, !tbaa !6
  %47 = add nuw nsw i64 %42, 1
  %48 = icmp eq i64 %47, %40
  br i1 %48, label %49, label %41

; <label>:49:                                     ; preds = %41, %36
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define internal fastcc void @vecset(i32* nocapture, i32) unnamed_addr #5 {
  %3 = load i32, i32* %0, align 4, !tbaa !6
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %22, label %5

; <label>:5:                                      ; preds = %2
  %6 = load i32, i32* %0, align 4, !tbaa !6
  %7 = sext i32 %6 to i64
  br label %8

; <label>:8:                                      ; preds = %16, %5
  %9 = phi i64 [ %18, %16 ], [ 1, %5 ]
  %10 = phi i32 [ %17, %16 ], [ 0, %5 ]
  %11 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %9
  %12 = load i32, i32* %11, align 4, !tbaa !6
  %13 = icmp eq i32 %12, %1
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %8
  %15 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %9
  store double 5.000000e-01, double* %15, align 8, !tbaa !2
  br label %16

; <label>:16:                                     ; preds = %8, %14
  %17 = phi i32 [ 1, %14 ], [ %10, %8 ]
  %18 = add nuw nsw i64 %9, 1
  %19 = icmp slt i64 %9, %7
  br i1 %19, label %8, label %20

; <label>:20:                                     ; preds = %16
  %21 = icmp eq i32 %17, 0
  br i1 %21, label %22, label %28

; <label>:22:                                     ; preds = %2, %20
  %23 = phi i32 [ %6, %20 ], [ %3, %2 ]
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %0, align 4, !tbaa !6
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %25
  store double 5.000000e-01, double* %26, align 8, !tbaa !2
  %27 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %25
  store i32 %1, i32* %27, align 4, !tbaa !6
  br label %28

; <label>:28:                                     ; preds = %22, %20
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

; Function Attrs: norecurse nounwind uwtable
define internal fastcc void @sparse(i32, i32, i32, i32* nocapture, i32) unnamed_addr #5 {
  %6 = sub nsw i32 %2, %1
  %7 = add nsw i32 %6, 1
  %8 = icmp slt i32 %0, 1
  br i1 %8, label %14, label %9

; <label>:9:                                      ; preds = %5
  %10 = zext i32 %0 to i64
  %11 = shl nuw nsw i64 %10, 2
  call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1) to i8*), i8 0, i64 %11, i32 4, i1 false)
  %12 = zext i32 %0 to i64
  %13 = shl nuw nsw i64 %12, 2
  call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1) to i8*), i8 0, i64 %13, i32 4, i1 false)
  br label %14

; <label>:14:                                     ; preds = %9, %5
  %15 = add nsw i32 %0, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %16
  store i32 0, i32* %17, align 4, !tbaa !6
  %18 = icmp slt i32 %4, 1
  br i1 %18, label %34, label %19

; <label>:19:                                     ; preds = %14
  %20 = sub i32 2, %1
  %21 = add i32 %4, 1
  %22 = zext i32 %21 to i64
  br label %23

; <label>:23:                                     ; preds = %23, %19
  %24 = phi i64 [ %32, %23 ], [ 1, %19 ]
  %25 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !6
  %27 = add i32 %20, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %28
  %30 = load i32, i32* %29, align 4, !tbaa !6
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %29, align 4, !tbaa !6
  %32 = add nuw nsw i64 %24, 1
  %33 = icmp eq i64 %32, %22
  br i1 %33, label %34, label %23

; <label>:34:                                     ; preds = %23, %14
  store i32 1, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  %35 = icmp slt i32 %6, 0
  br i1 %35, label %75, label %36

; <label>:36:                                     ; preds = %34
  %37 = add nsw i32 %6, 2
  %38 = sext i32 %37 to i64
  %39 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4
  br label %40

; <label>:40:                                     ; preds = %40, %36
  %41 = phi i32 [ %39, %36 ], [ %45, %40 ]
  %42 = phi i64 [ 2, %36 ], [ %46, %40 ]
  %43 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %42
  %44 = load i32, i32* %43, align 4, !tbaa !6
  %45 = add nsw i32 %41, %44
  store i32 %45, i32* %43, align 4, !tbaa !6
  %46 = add nuw nsw i64 %42, 1
  %47 = icmp slt i64 %42, %38
  br i1 %47, label %40, label %48

; <label>:48:                                     ; preds = %40
  %49 = icmp slt i32 %6, 0
  br i1 %49, label %75, label %50

; <label>:50:                                     ; preds = %48
  %51 = zext i32 %7 to i64
  br label %52

; <label>:52:                                     ; preds = %73, %50
  %53 = phi i64 [ %56, %73 ], [ 0, %50 ]
  %54 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !6
  %56 = add nuw nsw i64 %53, 1
  %57 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !6
  %59 = icmp slt i32 %55, %58
  br i1 %59, label %60, label %73

; <label>:60:                                     ; preds = %52
  %61 = load i32, i32* %57, align 4, !tbaa !6
  %62 = sext i32 %55 to i64
  %63 = getelementptr [2198001 x double], [2198001 x double]* @a, i64 0, i64 %62
  %64 = bitcast double* %63 to i8*
  %65 = add i32 %55, 1
  %66 = icmp sgt i32 %61, %65
  %67 = select i1 %66, i32 %61, i32 %65
  %68 = add i32 %67, -1
  %69 = sub i32 %68, %55
  %70 = zext i32 %69 to i64
  %71 = shl nuw nsw i64 %70, 3
  %72 = add nuw nsw i64 %71, 8
  call void @llvm.memset.p0i8.i64(i8* %64, i8 0, i64 %72, i32 8, i1 false)
  br label %73

; <label>:73:                                     ; preds = %60, %52
  %74 = icmp eq i64 %56, %51
  br i1 %74, label %75, label %52

; <label>:75:                                     ; preds = %73, %34, %48
  %76 = icmp slt i32 %4, 1
  br i1 %76, label %101, label %77

; <label>:77:                                     ; preds = %75
  %78 = sub i32 1, %1
  %79 = add i32 %4, 1
  %80 = zext i32 %79 to i64
  br label %81

; <label>:81:                                     ; preds = %81, %77
  %82 = phi i64 [ %99, %81 ], [ 1, %77 ]
  %83 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %82
  %84 = load i32, i32* %83, align 4, !tbaa !6
  %85 = add i32 %78, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %86
  %88 = load i32, i32* %87, align 4, !tbaa !6
  %89 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %82
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8, !tbaa !2
  %92 = sext i32 %88 to i64
  %93 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %92
  %94 = bitcast double* %93 to i64*
  store i64 %91, i64* %94, align 8, !tbaa !2
  %95 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %82
  %96 = load i32, i32* %95, align 4, !tbaa !6
  %97 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %92
  store i32 %96, i32* %97, align 4, !tbaa !6
  %98 = add nsw i32 %88, 1
  store i32 %98, i32* %87, align 4, !tbaa !6
  %99 = add nuw nsw i64 %82, 1
  %100 = icmp eq i64 %99, %80
  br i1 %100, label %101, label %81

; <label>:101:                                    ; preds = %81, %75
  %102 = icmp sgt i32 %6, -1
  br i1 %102, label %103, label %113

; <label>:103:                                    ; preds = %101
  %104 = sext i32 %7 to i64
  br label %105

; <label>:105:                                    ; preds = %103, %105
  %106 = phi i64 [ %104, %103 ], [ %111, %105 ]
  %107 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %106
  %108 = load i32, i32* %107, align 4, !tbaa !6
  %109 = add nsw i64 %106, 1
  %110 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %109
  store i32 %108, i32* %110, align 4, !tbaa !6
  %111 = add nsw i64 %106, -1
  %112 = icmp sgt i64 %106, 1
  br i1 %112, label %105, label %113

; <label>:113:                                    ; preds = %105, %101
  store i32 1, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  %114 = icmp slt i32 %0, 1
  br i1 %114, label %120, label %115

; <label>:115:                                    ; preds = %113
  %116 = zext i32 %0 to i64
  %117 = shl nuw nsw i64 %116, 3
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 1) to i8*), i8 0, i64 %117, i32 8, i1 false)
  %118 = zext i32 %0 to i64
  %119 = shl nuw nsw i64 %118, 2
  call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1) to i8*), i8 0, i64 %119, i32 4, i1 false)
  br label %120

; <label>:120:                                    ; preds = %115, %113
  %121 = icmp slt i32 %6, 0
  br i1 %121, label %192, label %122

; <label>:122:                                    ; preds = %120
  %123 = add i32 %2, 2
  %124 = sub i32 %123, %1
  %125 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  %126 = zext i32 %124 to i64
  br label %127

; <label>:127:                                    ; preds = %122, %187
  %128 = phi i64 [ 1, %122 ], [ %131, %187 ]
  %129 = phi i32 [ 0, %122 ], [ %189, %187 ]
  %130 = phi i32 [ 1, %122 ], [ %188, %187 ]
  %131 = add nuw nsw i64 %128, 1
  %132 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %131
  %133 = load i32, i32* %132, align 4, !tbaa !6
  %134 = icmp slt i32 %130, %133
  br i1 %134, label %135, label %187

; <label>:135:                                    ; preds = %127
  %136 = load i32, i32* %132, align 4, !tbaa !6
  %137 = sext i32 %130 to i64
  %138 = sext i32 %136 to i64
  br label %139

; <label>:139:                                    ; preds = %135, %159
  %140 = phi i64 [ %137, %135 ], [ %161, %159 ]
  %141 = phi i32 [ 0, %135 ], [ %160, %159 ]
  %142 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %140
  %143 = load i32, i32* %142, align 4, !tbaa !6
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %144
  %146 = load double, double* %145, align 8, !tbaa !2
  %147 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %140
  %148 = load double, double* %147, align 8, !tbaa !2
  %149 = fadd double %146, %148
  store double %149, double* %145, align 8, !tbaa !2
  %150 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %144
  %151 = load i32, i32* %150, align 4, !tbaa !6
  %152 = icmp eq i32 %151, 0
  %153 = fcmp une double %149, 0.000000e+00
  %154 = and i1 %153, %152
  br i1 %154, label %155, label %159

; <label>:155:                                    ; preds = %139
  store i32 1, i32* %150, align 4, !tbaa !6
  %156 = add nsw i32 %141, 1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32* %3, i64 %157
  store i32 %143, i32* %158, align 4, !tbaa !6
  br label %159

; <label>:159:                                    ; preds = %139, %155
  %160 = phi i32 [ %156, %155 ], [ %141, %139 ]
  %161 = add nsw i64 %140, 1
  %162 = icmp slt i64 %161, %138
  br i1 %162, label %139, label %163

; <label>:163:                                    ; preds = %159
  %164 = icmp slt i32 %160, 1
  br i1 %164, label %187, label %165

; <label>:165:                                    ; preds = %163
  %166 = add i32 %160, 1
  %167 = zext i32 %166 to i64
  br label %168

; <label>:168:                                    ; preds = %183, %165
  %169 = phi i64 [ %185, %183 ], [ 1, %165 ]
  %170 = phi i32 [ %184, %183 ], [ %129, %165 ]
  %171 = getelementptr inbounds i32, i32* %3, i64 %169
  %172 = load i32, i32* %171, align 4, !tbaa !6
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %173
  store i32 0, i32* %174, align 4, !tbaa !6
  %175 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %173
  %176 = load double, double* %175, align 8, !tbaa !2
  store double 0.000000e+00, double* %175, align 8, !tbaa !2
  %177 = fcmp une double %176, 0.000000e+00
  br i1 %177, label %178, label %183

; <label>:178:                                    ; preds = %168
  %179 = add nsw i32 %170, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %180
  store double %176, double* %181, align 8, !tbaa !2
  %182 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %180
  store i32 %172, i32* %182, align 4, !tbaa !6
  br label %183

; <label>:183:                                    ; preds = %168, %178
  %184 = phi i32 [ %179, %178 ], [ %170, %168 ]
  %185 = add nuw nsw i64 %169, 1
  %186 = icmp eq i64 %185, %167
  br i1 %186, label %187, label %168

; <label>:187:                                    ; preds = %183, %127, %163
  %188 = phi i32 [ %136, %163 ], [ %133, %127 ], [ %136, %183 ]
  %189 = phi i32 [ %129, %163 ], [ %129, %127 ], [ %184, %183 ]
  %190 = add nsw i32 %125, %189
  store i32 %190, i32* %132, align 4, !tbaa !6
  %191 = icmp eq i64 %131, %126
  br i1 %191, label %192, label %127

; <label>:192:                                    ; preds = %187, %120
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define internal fastcc i32 @icnvrt(double, i32) unnamed_addr #7 {
  %3 = sitofp i32 %1 to double
  %4 = fmul double %3, %0
  %5 = fptosi double %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #8

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (tags/RELEASE_601/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}

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
@colidx = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@rowstr = internal unnamed_addr global [14002 x i32] zeroinitializer, align 16
@arow = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@acol = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@aelt = internal unnamed_addr global [2198001 x double] zeroinitializer, align 16
@v = internal unnamed_addr global [14002 x double] zeroinitializer, align 16
@iv = internal unnamed_addr global [28002 x i32] zeroinitializer, align 16
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
@.str.21 = private unnamed_addr constant [7 x i8] c"-Ofast\00", align 1
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
@str.32 = private unnamed_addr constant [44 x i8] c"Space for matrix elements exceeded in makea\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #6
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
  %8 = tail call fast double @randlc(double* nonnull @tran, double 0x41D2309CE5400000) #6
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
  %21 = sitofp i32 %10 to double
  %22 = fdiv fast double 1.000000e+00, %21
  %23 = tail call fast double @llvm.pow.f64(double 1.000000e-01, double %22) #6
  br i1 %9, label %24, label %182

; <label>:24:                                     ; preds = %2
  %25 = zext i32 %10 to i64
  %26 = or i64 %25, 1
  %27 = getelementptr [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %26
  %28 = bitcast i32* %27 to i8*
  %29 = shl nuw nsw i32 %10, 2
  %30 = zext i32 %29 to i64
  tail call void @llvm.memset.p0i8.i64(i8* %28, i8 0, i64 %30, i32 4, i1 false) #6
  %31 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %25
  br label %32

; <label>:32:                                     ; preds = %178, %24
  %33 = phi i32 [ 0, %24 ], [ %172, %178 ]
  %34 = phi i32 [ 1, %24 ], [ %180, %178 ]
  %35 = phi double [ 1.000000e+00, %24 ], [ %179, %178 ]
  br label %36

; <label>:36:                                     ; preds = %36, %32
  %37 = phi i32 [ 1, %32 ], [ %38, %36 ]
  %38 = shl nsw i32 %37, 1
  %39 = icmp slt i32 %38, %10
  br i1 %39, label %36, label %40

; <label>:40:                                     ; preds = %36
  %41 = sitofp i32 %38 to double
  br label %42

; <label>:42:                                     ; preds = %67, %40
  %43 = phi i32 [ 0, %40 ], [ %69, %67 ]
  %44 = phi i32 [ 0, %40 ], [ %68, %67 ]
  br label %45

; <label>:45:                                     ; preds = %45, %42
  %46 = load double, double* @amult, align 8, !tbaa !2
  %47 = tail call fast double @randlc(double* nonnull @tran, double %46) #6
  %48 = load double, double* @amult, align 8, !tbaa !2
  %49 = tail call fast double @randlc(double* nonnull @tran, double %48) #6
  %50 = fmul fast double %49, %41
  %51 = fptosi double %50 to i32
  %52 = icmp sgt i32 %10, %51
  br i1 %52, label %53, label %45

; <label>:53:                                     ; preds = %45
  %54 = add nsw i32 %51, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %31, i64 %55
  %57 = load i32, i32* %56, align 4, !tbaa !6
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %67

; <label>:59:                                     ; preds = %53
  store i32 1, i32* %56, align 4, !tbaa !6
  %60 = add nsw i32 %43, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %61
  store i32 %54, i32* %62, align 4, !tbaa !6
  %63 = add nsw i32 %44, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %64
  store double %47, double* %65, align 8, !tbaa !2
  %66 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %64
  store i32 %54, i32* %66, align 4, !tbaa !6
  br label %67

; <label>:67:                                     ; preds = %59, %53
  %68 = phi i32 [ %63, %59 ], [ %44, %53 ]
  %69 = phi i32 [ %60, %59 ], [ %43, %53 ]
  %70 = icmp slt i32 %68, 11
  br i1 %70, label %42, label %71

; <label>:71:                                     ; preds = %67
  %72 = icmp slt i32 %69, 1
  br i1 %72, label %122, label %73

; <label>:73:                                     ; preds = %71
  %74 = add i32 %69, 1
  %75 = zext i32 %74 to i64
  %76 = add nsw i64 %75, -2
  %77 = and i32 %69, 3
  %78 = zext i32 %77 to i64
  %79 = icmp ult i64 %76, 3
  br i1 %79, label %108, label %80

; <label>:80:                                     ; preds = %73
  %81 = add nsw i64 %75, -1
  %82 = sub nsw i64 %81, %78
  br label %83

; <label>:83:                                     ; preds = %83, %80
  %84 = phi i64 [ 1, %80 ], [ %105, %83 ]
  %85 = phi i64 [ %82, %80 ], [ %106, %83 ]
  %86 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %84
  %87 = load i32, i32* %86, align 4, !tbaa !6
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32* %31, i64 %88
  store i32 0, i32* %89, align 4, !tbaa !6
  %90 = add nuw nsw i64 %84, 1
  %91 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %90
  %92 = load i32, i32* %91, align 4, !tbaa !6
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32* %31, i64 %93
  store i32 0, i32* %94, align 4, !tbaa !6
  %95 = add nuw nsw i64 %84, 2
  %96 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %95
  %97 = load i32, i32* %96, align 4, !tbaa !6
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32* %31, i64 %98
  store i32 0, i32* %99, align 4, !tbaa !6
  %100 = add nuw nsw i64 %84, 3
  %101 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %100
  %102 = load i32, i32* %101, align 4, !tbaa !6
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32* %31, i64 %103
  store i32 0, i32* %104, align 4, !tbaa !6
  %105 = add nuw nsw i64 %84, 4
  %106 = add i64 %85, -4
  %107 = icmp eq i64 %106, 0
  br i1 %107, label %108, label %83

; <label>:108:                                    ; preds = %83, %73
  %109 = phi i64 [ 1, %73 ], [ %105, %83 ]
  %110 = icmp eq i32 %77, 0
  br i1 %110, label %122, label %111

; <label>:111:                                    ; preds = %108
  br label %112

; <label>:112:                                    ; preds = %112, %111
  %113 = phi i64 [ %119, %112 ], [ %109, %111 ]
  %114 = phi i64 [ %120, %112 ], [ %78, %111 ]
  %115 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %113
  %116 = load i32, i32* %115, align 4, !tbaa !6
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32* %31, i64 %117
  store i32 0, i32* %118, align 4, !tbaa !6
  %119 = add nuw nsw i64 %113, 1
  %120 = add i64 %114, -1
  %121 = icmp eq i64 %120, 0
  br i1 %121, label %122, label %112, !llvm.loop !8

; <label>:122:                                    ; preds = %108, %112, %71
  %123 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1), align 4, !tbaa !6
  %124 = icmp eq i32 %123, %34
  br i1 %124, label %125, label %126

; <label>:125:                                    ; preds = %122
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 1), align 8, !tbaa !2
  br label %126

; <label>:126:                                    ; preds = %125, %122
  %127 = phi i32 [ 1, %125 ], [ 0, %122 ]
  %128 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 2), align 8, !tbaa !6
  %129 = icmp eq i32 %128, %34
  br i1 %129, label %461, label %462

; <label>:130:                                    ; preds = %507
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 12), align 16, !tbaa !2
  store i32 %34, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 12), align 16, !tbaa !6
  br label %131

; <label>:131:                                    ; preds = %507, %506, %130
  %132 = phi i64 [ 12, %130 ], [ 11, %507 ], [ 11, %506 ]
  br label %133

; <label>:133:                                    ; preds = %175, %131
  %134 = phi i32 [ %177, %175 ], [ %123, %131 ]
  %135 = phi i64 [ %173, %175 ], [ 1, %131 ]
  %136 = phi i32 [ %172, %175 ], [ %33, %131 ]
  %137 = icmp slt i32 %134, %18
  %138 = icmp sgt i32 %134, %20
  %139 = or i1 %137, %138
  br i1 %139, label %171, label %140

; <label>:140:                                    ; preds = %133
  %141 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %135
  %142 = load double, double* %141, align 8, !tbaa !2
  %143 = fmul fast double %142, %35
  br label %144

; <label>:144:                                    ; preds = %167, %140
  %145 = phi i64 [ %169, %167 ], [ 1, %140 ]
  %146 = phi i32 [ %168, %167 ], [ %136, %140 ]
  %147 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %145
  %148 = load i32, i32* %147, align 4, !tbaa !6
  %149 = icmp slt i32 %148, %14
  %150 = icmp sgt i32 %148, %16
  %151 = or i1 %149, %150
  br i1 %151, label %167, label %152

; <label>:152:                                    ; preds = %144
  %153 = add nsw i32 %146, 1
  %154 = icmp slt i32 %146, %12
  br i1 %154, label %159, label %155

; <label>:155:                                    ; preds = %152
  %156 = tail call i32 @puts(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @str.32, i64 0, i64 0)) #6
  %157 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), i32 %153, i32 %12) #6
  %158 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i64 0, i64 0), i32 %34) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:159:                                    ; preds = %152
  %160 = sext i32 %153 to i64
  %161 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %160
  store i32 %134, i32* %161, align 4, !tbaa !6
  %162 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %160
  store i32 %148, i32* %162, align 4, !tbaa !6
  %163 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %145
  %164 = load double, double* %163, align 8, !tbaa !2
  %165 = fmul fast double %143, %164
  %166 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %160
  store double %165, double* %166, align 8, !tbaa !2
  br label %167

; <label>:167:                                    ; preds = %159, %144
  %168 = phi i32 [ %153, %159 ], [ %146, %144 ]
  %169 = add nuw nsw i64 %145, 1
  %170 = icmp ult i64 %145, %132
  br i1 %170, label %144, label %171

; <label>:171:                                    ; preds = %167, %133
  %172 = phi i32 [ %136, %133 ], [ %168, %167 ]
  %173 = add nuw nsw i64 %135, 1
  %174 = icmp ult i64 %135, %132
  br i1 %174, label %175, label %178

; <label>:175:                                    ; preds = %171
  %176 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %173
  %177 = load i32, i32* %176, align 4, !tbaa !6
  br label %133

; <label>:178:                                    ; preds = %171
  %179 = fmul fast double %35, %23
  %180 = add nuw nsw i32 %34, 1
  %181 = icmp ult i32 %34, %10
  br i1 %181, label %32, label %182

; <label>:182:                                    ; preds = %178, %2
  %183 = phi i32 [ 0, %2 ], [ %172, %178 ]
  %184 = icmp ult i32 %16, %14
  br i1 %184, label %209, label %185

; <label>:185:                                    ; preds = %182
  br label %186

; <label>:186:                                    ; preds = %185, %205
  %187 = phi i32 [ %207, %205 ], [ %14, %185 ]
  %188 = phi i32 [ %206, %205 ], [ %183, %185 ]
  %189 = icmp ult i32 %187, %18
  %190 = icmp ugt i32 %187, %20
  %191 = or i1 %189, %190
  br i1 %191, label %205, label %192

; <label>:192:                                    ; preds = %186
  %193 = add nsw i32 %188, 1
  %194 = icmp slt i32 %188, %12
  br i1 %194, label %200, label %195

; <label>:195:                                    ; preds = %192
  %196 = add nuw nsw i32 %187, %10
  %197 = tail call i32 @puts(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @str.32, i64 0, i64 0)) #6
  %198 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), i32 %193, i32 %12) #6
  %199 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i64 0, i64 0), i32 %196) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:200:                                    ; preds = %192
  %201 = sext i32 %193 to i64
  %202 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %201
  store i32 %187, i32* %202, align 4, !tbaa !6
  %203 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %201
  store i32 %187, i32* %203, align 4, !tbaa !6
  %204 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %201
  store double -1.990000e+01, double* %204, align 8, !tbaa !2
  br label %205

; <label>:205:                                    ; preds = %200, %186
  %206 = phi i32 [ %193, %200 ], [ %188, %186 ]
  %207 = add nuw nsw i32 %187, 1
  %208 = icmp ult i32 %187, %16
  br i1 %208, label %186, label %209

; <label>:209:                                    ; preds = %205, %182
  %210 = phi i32 [ %183, %182 ], [ %206, %205 ]
  %211 = zext i32 %10 to i64
  %212 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %211
  %213 = sub nsw i32 %16, %14
  %214 = add nsw i32 %213, 1
  br i1 %9, label %215, label %218

; <label>:215:                                    ; preds = %209
  %216 = shl nuw nsw i32 %10, 2
  %217 = zext i32 %216 to i64
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1) to i8*), i8 0, i64 %217, i32 4, i1 false) #6
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1) to i8*), i8 0, i64 %217, i32 4, i1 false) #6
  br label %218

; <label>:218:                                    ; preds = %209, %215
  %219 = or i32 %10, 1
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %220
  store i32 0, i32* %221, align 4, !tbaa !6
  %222 = icmp slt i32 %210, 1
  br i1 %222, label %266, label %223

; <label>:223:                                    ; preds = %218
  %224 = select i1 %13, i32 1, i32 2
  %225 = add i32 %210, 1
  %226 = and i32 %225, 1
  %227 = xor i32 %226, 1
  %228 = icmp eq i32 %225, 2
  br i1 %228, label %255, label %229

; <label>:229:                                    ; preds = %223
  %230 = zext i32 %227 to i64
  %231 = zext i32 %225 to i64
  %232 = add nsw i64 %231, -1
  %233 = sub nsw i64 %232, %230
  br label %234

; <label>:234:                                    ; preds = %234, %229
  %235 = phi i64 [ 1, %229 ], [ %252, %234 ]
  %236 = phi i64 [ %233, %229 ], [ %253, %234 ]
  %237 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %235
  %238 = load i32, i32* %237, align 4, !tbaa !6
  %239 = add i32 %238, %224
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %240
  %242 = load i32, i32* %241, align 4, !tbaa !6
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* %241, align 4, !tbaa !6
  %244 = add nuw nsw i64 %235, 1
  %245 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %244
  %246 = load i32, i32* %245, align 4, !tbaa !6
  %247 = add i32 %246, %224
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %248
  %250 = load i32, i32* %249, align 4, !tbaa !6
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %249, align 4, !tbaa !6
  %252 = add nuw nsw i64 %235, 2
  %253 = add i64 %236, -2
  %254 = icmp eq i64 %253, 0
  br i1 %254, label %255, label %234

; <label>:255:                                    ; preds = %234, %223
  %256 = phi i64 [ 1, %223 ], [ %252, %234 ]
  %257 = icmp eq i32 %227, 0
  br i1 %257, label %266, label %258

; <label>:258:                                    ; preds = %255
  %259 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %256
  %260 = load i32, i32* %259, align 4, !tbaa !6
  %261 = add i32 %260, %224
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %262
  %264 = load i32, i32* %263, align 4, !tbaa !6
  %265 = add nsw i32 %264, 1
  store i32 %265, i32* %263, align 4, !tbaa !6
  br label %266

; <label>:266:                                    ; preds = %258, %255, %218
  store i32 1, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  %267 = icmp slt i32 %213, 0
  br i1 %267, label %303, label %268

; <label>:268:                                    ; preds = %266
  %269 = add nsw i32 %213, 2
  %270 = sext i32 %269 to i64
  br label %271

; <label>:271:                                    ; preds = %271, %268
  %272 = phi i32 [ %276, %271 ], [ 1, %268 ]
  %273 = phi i64 [ %277, %271 ], [ 2, %268 ]
  %274 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %273
  %275 = load i32, i32* %274, align 4, !tbaa !6
  %276 = add nsw i32 %275, %272
  store i32 %276, i32* %274, align 4, !tbaa !6
  %277 = add nuw nsw i64 %273, 1
  %278 = icmp slt i64 %273, %270
  br i1 %278, label %271, label %279

; <label>:279:                                    ; preds = %271
  %280 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 0), align 16, !tbaa !6
  %281 = zext i32 %214 to i64
  br label %282

; <label>:282:                                    ; preds = %301, %279
  %283 = phi i32 [ %287, %301 ], [ %280, %279 ]
  %284 = phi i64 [ %285, %301 ], [ 0, %279 ]
  %285 = add nuw nsw i64 %284, 1
  %286 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %285
  %287 = load i32, i32* %286, align 4, !tbaa !6
  %288 = icmp slt i32 %283, %287
  br i1 %288, label %289, label %301

; <label>:289:                                    ; preds = %282
  %290 = sext i32 %283 to i64
  %291 = getelementptr [2198001 x double], [2198001 x double]* @a, i64 0, i64 %290
  %292 = bitcast double* %291 to i8*
  %293 = add i32 %283, 1
  %294 = icmp sgt i32 %287, %293
  %295 = select i1 %294, i32 %287, i32 %293
  %296 = xor i32 %283, -1
  %297 = add i32 %295, %296
  %298 = zext i32 %297 to i64
  %299 = shl nuw nsw i64 %298, 3
  %300 = add nuw nsw i64 %299, 8
  tail call void @llvm.memset.p0i8.i64(i8* %292, i8 0, i64 %300, i32 8, i1 false) #6
  br label %301

; <label>:301:                                    ; preds = %289, %282
  %302 = icmp eq i64 %285, %281
  br i1 %302, label %303, label %282

; <label>:303:                                    ; preds = %301, %266
  br i1 %222, label %375, label %304

; <label>:304:                                    ; preds = %303
  %305 = xor i1 %13, true
  %306 = zext i1 %305 to i32
  %307 = add i32 %210, 1
  %308 = and i32 %307, 1
  %309 = xor i32 %308, 1
  %310 = icmp eq i32 %307, 2
  br i1 %310, label %355, label %311

; <label>:311:                                    ; preds = %304
  %312 = zext i32 %309 to i64
  %313 = zext i32 %307 to i64
  %314 = add nsw i64 %313, -1
  %315 = sub nsw i64 %314, %312
  br label %316

; <label>:316:                                    ; preds = %316, %311
  %317 = phi i64 [ 1, %311 ], [ %352, %316 ]
  %318 = phi i64 [ %315, %311 ], [ %353, %316 ]
  %319 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %317
  %320 = load i32, i32* %319, align 4, !tbaa !6
  %321 = add i32 %320, %306
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %322
  %324 = load i32, i32* %323, align 4, !tbaa !6
  %325 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %317
  %326 = bitcast double* %325 to i64*
  %327 = load i64, i64* %326, align 8, !tbaa !2
  %328 = sext i32 %324 to i64
  %329 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %328
  %330 = bitcast double* %329 to i64*
  store i64 %327, i64* %330, align 8, !tbaa !2
  %331 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %317
  %332 = load i32, i32* %331, align 4, !tbaa !6
  %333 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %328
  store i32 %332, i32* %333, align 4, !tbaa !6
  %334 = add nsw i32 %324, 1
  store i32 %334, i32* %323, align 4, !tbaa !6
  %335 = add nuw nsw i64 %317, 1
  %336 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %335
  %337 = load i32, i32* %336, align 4, !tbaa !6
  %338 = add i32 %337, %306
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %339
  %341 = load i32, i32* %340, align 4, !tbaa !6
  %342 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %335
  %343 = bitcast double* %342 to i64*
  %344 = load i64, i64* %343, align 8, !tbaa !2
  %345 = sext i32 %341 to i64
  %346 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %345
  %347 = bitcast double* %346 to i64*
  store i64 %344, i64* %347, align 8, !tbaa !2
  %348 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %335
  %349 = load i32, i32* %348, align 4, !tbaa !6
  %350 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %345
  store i32 %349, i32* %350, align 4, !tbaa !6
  %351 = add nsw i32 %341, 1
  store i32 %351, i32* %340, align 4, !tbaa !6
  %352 = add nuw nsw i64 %317, 2
  %353 = add i64 %318, -2
  %354 = icmp eq i64 %353, 0
  br i1 %354, label %355, label %316

; <label>:355:                                    ; preds = %316, %304
  %356 = phi i64 [ 1, %304 ], [ %352, %316 ]
  %357 = icmp eq i32 %309, 0
  br i1 %357, label %375, label %358

; <label>:358:                                    ; preds = %355
  %359 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %356
  %360 = load i32, i32* %359, align 4, !tbaa !6
  %361 = add i32 %360, %306
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %362
  %364 = load i32, i32* %363, align 4, !tbaa !6
  %365 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %356
  %366 = bitcast double* %365 to i64*
  %367 = load i64, i64* %366, align 8, !tbaa !2
  %368 = sext i32 %364 to i64
  %369 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %368
  %370 = bitcast double* %369 to i64*
  store i64 %367, i64* %370, align 8, !tbaa !2
  %371 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %356
  %372 = load i32, i32* %371, align 4, !tbaa !6
  %373 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %368
  store i32 %372, i32* %373, align 4, !tbaa !6
  %374 = add nsw i32 %364, 1
  store i32 %374, i32* %363, align 4, !tbaa !6
  br label %375

; <label>:375:                                    ; preds = %358, %355, %303
  %376 = icmp sgt i32 %213, -1
  br i1 %376, label %377, label %387

; <label>:377:                                    ; preds = %375
  %378 = sext i32 %214 to i64
  br label %379

; <label>:379:                                    ; preds = %379, %377
  %380 = phi i64 [ %378, %377 ], [ %385, %379 ]
  %381 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %380
  %382 = load i32, i32* %381, align 4, !tbaa !6
  %383 = add nuw nsw i64 %380, 1
  %384 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %383
  store i32 %382, i32* %384, align 4, !tbaa !6
  %385 = add nsw i64 %380, -1
  %386 = icmp sgt i64 %380, 1
  br i1 %386, label %379, label %387

; <label>:387:                                    ; preds = %379, %375
  store i32 1, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  br i1 %9, label %388, label %393

; <label>:388:                                    ; preds = %387
  %389 = shl nuw nsw i32 %10, 3
  %390 = zext i32 %389 to i64
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 1) to i8*), i8 0, i64 %390, i32 8, i1 false) #6
  %391 = shl nuw nsw i32 %10, 2
  %392 = zext i32 %391 to i64
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1) to i8*), i8 0, i64 %392, i32 4, i1 false) #6
  br label %393

; <label>:393:                                    ; preds = %387, %388
  br i1 %267, label %509, label %394

; <label>:394:                                    ; preds = %393
  %395 = select i1 %13, i32 1, i32 2
  %396 = or i32 %16, %395
  %397 = zext i32 %396 to i64
  br label %398

; <label>:398:                                    ; preds = %457, %394
  %399 = phi i64 [ 1, %394 ], [ %402, %457 ]
  %400 = phi i32 [ 0, %394 ], [ %458, %457 ]
  %401 = phi i32 [ 1, %394 ], [ %404, %457 ]
  %402 = add nuw nsw i64 %399, 1
  %403 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %402
  %404 = load i32, i32* %403, align 4, !tbaa !6
  %405 = icmp slt i32 %401, %404
  br i1 %405, label %406, label %457

; <label>:406:                                    ; preds = %398
  %407 = sext i32 %401 to i64
  %408 = sext i32 %404 to i64
  br label %409

; <label>:409:                                    ; preds = %429, %406
  %410 = phi i64 [ %407, %406 ], [ %431, %429 ]
  %411 = phi i32 [ 0, %406 ], [ %430, %429 ]
  %412 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %410
  %413 = load i32, i32* %412, align 4, !tbaa !6
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %414
  %416 = load double, double* %415, align 8, !tbaa !2
  %417 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %410
  %418 = load double, double* %417, align 8, !tbaa !2
  %419 = fadd fast double %418, %416
  store double %419, double* %415, align 8, !tbaa !2
  %420 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %414
  %421 = load i32, i32* %420, align 4, !tbaa !6
  %422 = icmp eq i32 %421, 0
  %423 = fcmp fast une double %419, 0.000000e+00
  %424 = and i1 %423, %422
  br i1 %424, label %425, label %429

; <label>:425:                                    ; preds = %409
  store i32 1, i32* %420, align 4, !tbaa !6
  %426 = add nsw i32 %411, 1
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds i32, i32* %212, i64 %427
  store i32 %413, i32* %428, align 4, !tbaa !6
  br label %429

; <label>:429:                                    ; preds = %425, %409
  %430 = phi i32 [ %426, %425 ], [ %411, %409 ]
  %431 = add nsw i64 %410, 1
  %432 = icmp eq i64 %431, %408
  br i1 %432, label %433, label %409

; <label>:433:                                    ; preds = %429
  %434 = icmp slt i32 %430, 1
  br i1 %434, label %457, label %435

; <label>:435:                                    ; preds = %433
  %436 = add i32 %430, 1
  %437 = zext i32 %436 to i64
  br label %438

; <label>:438:                                    ; preds = %453, %435
  %439 = phi i64 [ %455, %453 ], [ 1, %435 ]
  %440 = phi i32 [ %454, %453 ], [ %400, %435 ]
  %441 = getelementptr inbounds i32, i32* %212, i64 %439
  %442 = load i32, i32* %441, align 4, !tbaa !6
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %443
  store i32 0, i32* %444, align 4, !tbaa !6
  %445 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %443
  %446 = load double, double* %445, align 8, !tbaa !2
  store double 0.000000e+00, double* %445, align 8, !tbaa !2
  %447 = fcmp fast une double %446, 0.000000e+00
  br i1 %447, label %448, label %453

; <label>:448:                                    ; preds = %438
  %449 = add nsw i32 %440, 1
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %450
  store double %446, double* %451, align 8, !tbaa !2
  %452 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %450
  store i32 %442, i32* %452, align 4, !tbaa !6
  br label %453

; <label>:453:                                    ; preds = %448, %438
  %454 = phi i32 [ %449, %448 ], [ %440, %438 ]
  %455 = add nuw nsw i64 %439, 1
  %456 = icmp eq i64 %455, %437
  br i1 %456, label %457, label %438

; <label>:457:                                    ; preds = %453, %433, %398
  %458 = phi i32 [ %400, %433 ], [ %400, %398 ], [ %454, %453 ]
  %459 = add nsw i32 %458, 1
  store i32 %459, i32* %403, align 4, !tbaa !6
  %460 = icmp eq i64 %402, %397
  br i1 %460, label %509, label %398

; <label>:461:                                    ; preds = %126
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 2), align 16, !tbaa !2
  br label %462

; <label>:462:                                    ; preds = %461, %126
  %463 = phi i32 [ 1, %461 ], [ %127, %126 ]
  %464 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 3), align 4, !tbaa !6
  %465 = icmp eq i32 %464, %34
  br i1 %465, label %466, label %467

; <label>:466:                                    ; preds = %462
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 3), align 8, !tbaa !2
  br label %467

; <label>:467:                                    ; preds = %466, %462
  %468 = phi i32 [ 1, %466 ], [ %463, %462 ]
  %469 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 4), align 16, !tbaa !6
  %470 = icmp eq i32 %469, %34
  br i1 %470, label %471, label %472

; <label>:471:                                    ; preds = %467
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 4), align 16, !tbaa !2
  br label %472

; <label>:472:                                    ; preds = %471, %467
  %473 = phi i32 [ 1, %471 ], [ %468, %467 ]
  %474 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 5), align 4, !tbaa !6
  %475 = icmp eq i32 %474, %34
  br i1 %475, label %476, label %477

; <label>:476:                                    ; preds = %472
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 5), align 8, !tbaa !2
  br label %477

; <label>:477:                                    ; preds = %476, %472
  %478 = phi i32 [ 1, %476 ], [ %473, %472 ]
  %479 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 6), align 8, !tbaa !6
  %480 = icmp eq i32 %479, %34
  br i1 %480, label %481, label %482

; <label>:481:                                    ; preds = %477
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 6), align 16, !tbaa !2
  br label %482

; <label>:482:                                    ; preds = %481, %477
  %483 = phi i32 [ 1, %481 ], [ %478, %477 ]
  %484 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 7), align 4, !tbaa !6
  %485 = icmp eq i32 %484, %34
  br i1 %485, label %486, label %487

; <label>:486:                                    ; preds = %482
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 7), align 8, !tbaa !2
  br label %487

; <label>:487:                                    ; preds = %486, %482
  %488 = phi i32 [ 1, %486 ], [ %483, %482 ]
  %489 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 8), align 16, !tbaa !6
  %490 = icmp eq i32 %489, %34
  br i1 %490, label %491, label %492

; <label>:491:                                    ; preds = %487
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 8), align 16, !tbaa !2
  br label %492

; <label>:492:                                    ; preds = %491, %487
  %493 = phi i32 [ 1, %491 ], [ %488, %487 ]
  %494 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 9), align 4, !tbaa !6
  %495 = icmp eq i32 %494, %34
  br i1 %495, label %496, label %497

; <label>:496:                                    ; preds = %492
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 9), align 8, !tbaa !2
  br label %497

; <label>:497:                                    ; preds = %496, %492
  %498 = phi i32 [ 1, %496 ], [ %493, %492 ]
  %499 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 10), align 8, !tbaa !6
  %500 = icmp eq i32 %499, %34
  br i1 %500, label %501, label %502

; <label>:501:                                    ; preds = %497
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 10), align 16, !tbaa !2
  br label %502

; <label>:502:                                    ; preds = %501, %497
  %503 = phi i32 [ 1, %501 ], [ %498, %497 ]
  %504 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 11), align 4, !tbaa !6
  %505 = icmp eq i32 %504, %34
  br i1 %505, label %506, label %507

; <label>:506:                                    ; preds = %502
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 11), align 8, !tbaa !2
  br label %131

; <label>:507:                                    ; preds = %502
  %508 = icmp eq i32 %503, 0
  br i1 %508, label %130, label %131

; <label>:509:                                    ; preds = %457, %393
  %510 = load i1, i1* @lastrow, align 4
  %511 = load i1, i1* @firstrow, align 4
  %512 = sext i1 %511 to i32
  %513 = select i1 %510, i32 14001, i32 1
  %514 = add nsw i32 %513, %512
  %515 = icmp slt i32 %514, 1
  br i1 %515, label %611, label %516

; <label>:516:                                    ; preds = %509
  %517 = load i1, i1* @firstcol, align 4
  %518 = sext i1 %517 to i32
  %519 = sext i32 %514 to i64
  %520 = insertelement <4 x i32> undef, i32 %518, i32 0
  %521 = shufflevector <4 x i32> %520, <4 x i32> undef, <4 x i32> zeroinitializer
  %522 = insertelement <4 x i32> undef, i32 %518, i32 0
  %523 = shufflevector <4 x i32> %522, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %524

; <label>:524:                                    ; preds = %609, %516
  %525 = phi i32 [ %529, %609 ], [ 1, %516 ]
  %526 = phi i64 [ %527, %609 ], [ 1, %516 ]
  %527 = add nuw nsw i64 %526, 1
  %528 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %527
  %529 = load i32, i32* %528, align 4, !tbaa !6
  %530 = icmp slt i32 %525, %529
  br i1 %530, label %531, label %609

; <label>:531:                                    ; preds = %524
  %532 = sext i32 %525 to i64
  %533 = sext i32 %529 to i64
  %534 = sext i32 %529 to i64
  %535 = sub nsw i64 %534, %532
  %536 = icmp ult i64 %535, 8
  br i1 %536, label %599, label %537

; <label>:537:                                    ; preds = %531
  %538 = and i64 %535, -8
  %539 = add nsw i64 %538, %532
  %540 = add nsw i64 %538, -8
  %541 = lshr exact i64 %540, 3
  %542 = add nuw nsw i64 %541, 1
  %543 = and i64 %542, 1
  %544 = icmp eq i64 %540, 0
  br i1 %544, label %580, label %545

; <label>:545:                                    ; preds = %537
  %546 = sub nsw i64 %542, %543
  br label %547

; <label>:547:                                    ; preds = %547, %545
  %548 = phi i64 [ 0, %545 ], [ %577, %547 ]
  %549 = phi i64 [ %546, %545 ], [ %578, %547 ]
  %550 = add i64 %548, %532
  %551 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %550
  %552 = bitcast i32* %551 to <4 x i32>*
  %553 = load <4 x i32>, <4 x i32>* %552, align 4, !tbaa !6
  %554 = getelementptr i32, i32* %551, i64 4
  %555 = bitcast i32* %554 to <4 x i32>*
  %556 = load <4 x i32>, <4 x i32>* %555, align 4, !tbaa !6
  %557 = add <4 x i32> %553, <i32 1, i32 1, i32 1, i32 1>
  %558 = add <4 x i32> %556, <i32 1, i32 1, i32 1, i32 1>
  %559 = add <4 x i32> %557, %521
  %560 = add <4 x i32> %558, %523
  %561 = bitcast i32* %551 to <4 x i32>*
  store <4 x i32> %559, <4 x i32>* %561, align 4, !tbaa !6
  %562 = bitcast i32* %554 to <4 x i32>*
  store <4 x i32> %560, <4 x i32>* %562, align 4, !tbaa !6
  %563 = or i64 %548, 8
  %564 = add i64 %563, %532
  %565 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %564
  %566 = bitcast i32* %565 to <4 x i32>*
  %567 = load <4 x i32>, <4 x i32>* %566, align 4, !tbaa !6
  %568 = getelementptr i32, i32* %565, i64 4
  %569 = bitcast i32* %568 to <4 x i32>*
  %570 = load <4 x i32>, <4 x i32>* %569, align 4, !tbaa !6
  %571 = add <4 x i32> %567, <i32 1, i32 1, i32 1, i32 1>
  %572 = add <4 x i32> %570, <i32 1, i32 1, i32 1, i32 1>
  %573 = add <4 x i32> %571, %521
  %574 = add <4 x i32> %572, %523
  %575 = bitcast i32* %565 to <4 x i32>*
  store <4 x i32> %573, <4 x i32>* %575, align 4, !tbaa !6
  %576 = bitcast i32* %568 to <4 x i32>*
  store <4 x i32> %574, <4 x i32>* %576, align 4, !tbaa !6
  %577 = add i64 %548, 16
  %578 = add i64 %549, -2
  %579 = icmp eq i64 %578, 0
  br i1 %579, label %580, label %547, !llvm.loop !10

; <label>:580:                                    ; preds = %547, %537
  %581 = phi i64 [ 0, %537 ], [ %577, %547 ]
  %582 = icmp eq i64 %543, 0
  br i1 %582, label %597, label %583

; <label>:583:                                    ; preds = %580
  %584 = add i64 %581, %532
  %585 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %584
  %586 = bitcast i32* %585 to <4 x i32>*
  %587 = load <4 x i32>, <4 x i32>* %586, align 4, !tbaa !6
  %588 = getelementptr i32, i32* %585, i64 4
  %589 = bitcast i32* %588 to <4 x i32>*
  %590 = load <4 x i32>, <4 x i32>* %589, align 4, !tbaa !6
  %591 = add <4 x i32> %587, <i32 1, i32 1, i32 1, i32 1>
  %592 = add <4 x i32> %590, <i32 1, i32 1, i32 1, i32 1>
  %593 = add <4 x i32> %591, %521
  %594 = add <4 x i32> %592, %523
  %595 = bitcast i32* %585 to <4 x i32>*
  store <4 x i32> %593, <4 x i32>* %595, align 4, !tbaa !6
  %596 = bitcast i32* %588 to <4 x i32>*
  store <4 x i32> %594, <4 x i32>* %596, align 4, !tbaa !6
  br label %597

; <label>:597:                                    ; preds = %580, %583
  %598 = icmp eq i64 %535, %538
  br i1 %598, label %609, label %599

; <label>:599:                                    ; preds = %597, %531
  %600 = phi i64 [ %532, %531 ], [ %539, %597 ]
  br label %601

; <label>:601:                                    ; preds = %599, %601
  %602 = phi i64 [ %607, %601 ], [ %600, %599 ]
  %603 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %602
  %604 = load i32, i32* %603, align 4, !tbaa !6
  %605 = add i32 %604, 1
  %606 = add i32 %605, %518
  store i32 %606, i32* %603, align 4, !tbaa !6
  %607 = add nsw i64 %602, 1
  %608 = icmp slt i64 %607, %533
  br i1 %608, label %601, label %609, !llvm.loop !12

; <label>:609:                                    ; preds = %601, %597, %524
  %610 = icmp slt i64 %526, %519
  br i1 %610, label %524, label %611

; <label>:611:                                    ; preds = %609, %509
  br label %612

; <label>:612:                                    ; preds = %612, %611
  %613 = phi i64 [ 0, %611 ], [ %643, %612 ]
  %614 = or i64 %613, 1
  %615 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %614
  %616 = bitcast double* %615 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %616, align 8, !tbaa !2
  %617 = getelementptr double, double* %615, i64 2
  %618 = bitcast double* %617 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %618, align 8, !tbaa !2
  %619 = add nuw nsw i64 %613, 4
  %620 = or i64 %619, 1
  %621 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %620
  %622 = bitcast double* %621 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %622, align 8, !tbaa !2
  %623 = getelementptr double, double* %621, i64 2
  %624 = bitcast double* %623 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %624, align 8, !tbaa !2
  %625 = add nuw nsw i64 %613, 8
  %626 = or i64 %625, 1
  %627 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %626
  %628 = bitcast double* %627 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %628, align 8, !tbaa !2
  %629 = getelementptr double, double* %627, i64 2
  %630 = bitcast double* %629 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %630, align 8, !tbaa !2
  %631 = add nuw nsw i64 %613, 12
  %632 = or i64 %631, 1
  %633 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %632
  %634 = bitcast double* %633 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %634, align 8, !tbaa !2
  %635 = getelementptr double, double* %633, i64 2
  %636 = bitcast double* %635 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %636, align 8, !tbaa !2
  %637 = add nuw nsw i64 %613, 16
  %638 = or i64 %637, 1
  %639 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %638
  %640 = bitcast double* %639 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %640, align 8, !tbaa !2
  %641 = getelementptr double, double* %639, i64 2
  %642 = bitcast double* %641 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %642, align 8, !tbaa !2
  %643 = add nuw nsw i64 %613, 20
  %644 = icmp eq i64 %643, 14000
  br i1 %644, label %645, label %612, !llvm.loop !14

; <label>:645:                                    ; preds = %612
  store double 1.000000e+00, double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 14001), align 8, !tbaa !2
  %646 = load i1, i1* @lastcol, align 4
  %647 = select i1 %646, i32 14000, i32 0
  %648 = load i1, i1* @firstcol, align 4
  %649 = zext i1 %648 to i32
  %650 = sub nsw i32 %647, %649
  %651 = icmp slt i32 %650, 0
  br i1 %651, label %652, label %653

; <label>:652:                                    ; preds = %645
  call fastcc void @conj_grad(double* nonnull %3)
  br label %787

; <label>:653:                                    ; preds = %645
  %654 = or i32 %647, 1
  %655 = sub nsw i32 %654, %649
  %656 = icmp ugt i32 %655, 1
  %657 = select i1 %656, i32 %655, i32 1
  %658 = shl nuw nsw i32 %657, 3
  %659 = zext i32 %658 to i64
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i64 0, i64 1) to i8*), i8 0, i64 %659, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i64 0, i64 1) to i8*), i8 0, i64 %659, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i64 0, i64 1) to i8*), i8 0, i64 %659, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i64 0, i64 1) to i8*), i8 0, i64 %659, i32 8, i1 false)
  %660 = sext i32 %650 to i64
  call fastcc void @conj_grad(double* nonnull %3)
  %661 = or i32 %647, 1
  %662 = zext i32 %661 to i64
  %663 = zext i1 %648 to i64
  %664 = sub nsw i64 %662, %663
  %665 = icmp sgt i64 %664, 1
  %666 = select i1 %665, i64 %664, i64 1
  %667 = icmp ult i64 %666, 4
  br i1 %667, label %710, label %668

; <label>:668:                                    ; preds = %653
  %669 = and i64 %666, 14000
  %670 = or i64 %669, 1
  %671 = add nsw i64 %669, -4
  %672 = lshr exact i64 %671, 2
  %673 = add nuw nsw i64 %672, 1
  br label %674

; <label>:674:                                    ; preds = %674, %668
  %675 = phi i64 [ 0, %668 ], [ %701, %674 ]
  %676 = phi <2 x double> [ zeroinitializer, %668 ], [ %699, %674 ]
  %677 = phi <2 x double> [ zeroinitializer, %668 ], [ %700, %674 ]
  %678 = phi i64 [ %673, %668 ], [ %702, %674 ]
  %679 = or i64 %675, 1
  %680 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %679
  %681 = bitcast double* %680 to <2 x double>*
  %682 = load <2 x double>, <2 x double>* %681, align 8, !tbaa !2
  %683 = getelementptr double, double* %680, i64 2
  %684 = bitcast double* %683 to <2 x double>*
  %685 = load <2 x double>, <2 x double>* %684, align 8, !tbaa !2
  %686 = fmul fast <2 x double> %682, %682
  %687 = fmul fast <2 x double> %685, %685
  %688 = fadd fast <2 x double> %686, %676
  %689 = fadd fast <2 x double> %687, %677
  %690 = or i64 %675, 5
  %691 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %690
  %692 = bitcast double* %691 to <2 x double>*
  %693 = load <2 x double>, <2 x double>* %692, align 8, !tbaa !2
  %694 = getelementptr double, double* %691, i64 2
  %695 = bitcast double* %694 to <2 x double>*
  %696 = load <2 x double>, <2 x double>* %695, align 8, !tbaa !2
  %697 = fmul fast <2 x double> %693, %693
  %698 = fmul fast <2 x double> %696, %696
  %699 = fadd fast <2 x double> %697, %688
  %700 = fadd fast <2 x double> %698, %689
  %701 = add i64 %675, 8
  %702 = add i64 %678, -2
  %703 = icmp eq i64 %702, 0
  br i1 %703, label %704, label %674, !llvm.loop !15

; <label>:704:                                    ; preds = %674
  %705 = fadd fast <2 x double> %700, %699
  %706 = shufflevector <2 x double> %705, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %707 = fadd fast <2 x double> %705, %706
  %708 = extractelement <2 x double> %707, i32 0
  %709 = icmp eq i64 %666, %669
  br i1 %709, label %722, label %710

; <label>:710:                                    ; preds = %704, %653
  %711 = phi i64 [ 1, %653 ], [ %670, %704 ]
  %712 = phi double [ 0.000000e+00, %653 ], [ %708, %704 ]
  br label %713

; <label>:713:                                    ; preds = %710, %713
  %714 = phi i64 [ %720, %713 ], [ %711, %710 ]
  %715 = phi double [ %719, %713 ], [ %712, %710 ]
  %716 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %714
  %717 = load double, double* %716, align 8, !tbaa !2
  %718 = fmul fast double %717, %717
  %719 = fadd fast double %718, %715
  %720 = add nuw nsw i64 %714, 1
  %721 = icmp sgt i64 %714, %660
  br i1 %721, label %722, label %713, !llvm.loop !16

; <label>:722:                                    ; preds = %713, %704
  %723 = phi double [ %708, %704 ], [ %719, %713 ]
  %724 = tail call fast double @llvm.sqrt.f64(double %723)
  %725 = fdiv fast double 1.000000e+00, %724
  %726 = or i32 %647, 1
  %727 = zext i32 %726 to i64
  %728 = zext i1 %648 to i64
  %729 = sub nsw i64 %727, %728
  %730 = icmp sgt i64 %729, 1
  %731 = select i1 %730, i64 %729, i64 1
  %732 = icmp ult i64 %731, 4
  br i1 %732, label %777, label %733

; <label>:733:                                    ; preds = %722
  %734 = and i64 %731, 14000
  %735 = or i64 %734, 1
  %736 = insertelement <2 x double> undef, double %725, i32 0
  %737 = shufflevector <2 x double> %736, <2 x double> undef, <2 x i32> zeroinitializer
  %738 = insertelement <2 x double> undef, double %725, i32 0
  %739 = shufflevector <2 x double> %738, <2 x double> undef, <2 x i32> zeroinitializer
  %740 = add nsw i64 %734, -4
  %741 = lshr exact i64 %740, 2
  %742 = add nuw nsw i64 %741, 1
  br label %743

; <label>:743:                                    ; preds = %743, %733
  %744 = phi i64 [ 0, %733 ], [ %772, %743 ]
  %745 = phi i64 [ %742, %733 ], [ %773, %743 ]
  %746 = or i64 %744, 1
  %747 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %746
  %748 = bitcast double* %747 to <2 x double>*
  %749 = load <2 x double>, <2 x double>* %748, align 8, !tbaa !2
  %750 = getelementptr double, double* %747, i64 2
  %751 = bitcast double* %750 to <2 x double>*
  %752 = load <2 x double>, <2 x double>* %751, align 8, !tbaa !2
  %753 = fmul fast <2 x double> %749, %737
  %754 = fmul fast <2 x double> %752, %739
  %755 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %746
  %756 = bitcast double* %755 to <2 x double>*
  store <2 x double> %753, <2 x double>* %756, align 8, !tbaa !2
  %757 = getelementptr double, double* %755, i64 2
  %758 = bitcast double* %757 to <2 x double>*
  store <2 x double> %754, <2 x double>* %758, align 8, !tbaa !2
  %759 = or i64 %744, 5
  %760 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %759
  %761 = bitcast double* %760 to <2 x double>*
  %762 = load <2 x double>, <2 x double>* %761, align 8, !tbaa !2
  %763 = getelementptr double, double* %760, i64 2
  %764 = bitcast double* %763 to <2 x double>*
  %765 = load <2 x double>, <2 x double>* %764, align 8, !tbaa !2
  %766 = fmul fast <2 x double> %762, %737
  %767 = fmul fast <2 x double> %765, %739
  %768 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %759
  %769 = bitcast double* %768 to <2 x double>*
  store <2 x double> %766, <2 x double>* %769, align 8, !tbaa !2
  %770 = getelementptr double, double* %768, i64 2
  %771 = bitcast double* %770 to <2 x double>*
  store <2 x double> %767, <2 x double>* %771, align 8, !tbaa !2
  %772 = add i64 %744, 8
  %773 = add i64 %745, -2
  %774 = icmp eq i64 %773, 0
  br i1 %774, label %775, label %743, !llvm.loop !17

; <label>:775:                                    ; preds = %743
  %776 = icmp eq i64 %731, %734
  br i1 %776, label %787, label %777

; <label>:777:                                    ; preds = %775, %722
  %778 = phi i64 [ 1, %722 ], [ %735, %775 ]
  br label %779

; <label>:779:                                    ; preds = %777, %779
  %780 = phi i64 [ %785, %779 ], [ %778, %777 ]
  %781 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %780
  %782 = load double, double* %781, align 8, !tbaa !2
  %783 = fmul fast double %782, %725
  %784 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %780
  store double %783, double* %784, align 8, !tbaa !2
  %785 = add nuw nsw i64 %780, 1
  %786 = icmp sgt i64 %780, %660
  br i1 %786, label %787, label %779, !llvm.loop !18

; <label>:787:                                    ; preds = %779, %652, %775
  br label %788

; <label>:788:                                    ; preds = %788, %787
  %789 = phi i64 [ 0, %787 ], [ %819, %788 ]
  %790 = or i64 %789, 1
  %791 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %790
  %792 = bitcast double* %791 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %792, align 8, !tbaa !2
  %793 = getelementptr double, double* %791, i64 2
  %794 = bitcast double* %793 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %794, align 8, !tbaa !2
  %795 = add nuw nsw i64 %789, 4
  %796 = or i64 %795, 1
  %797 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %796
  %798 = bitcast double* %797 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %798, align 8, !tbaa !2
  %799 = getelementptr double, double* %797, i64 2
  %800 = bitcast double* %799 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %800, align 8, !tbaa !2
  %801 = add nuw nsw i64 %789, 8
  %802 = or i64 %801, 1
  %803 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %802
  %804 = bitcast double* %803 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %804, align 8, !tbaa !2
  %805 = getelementptr double, double* %803, i64 2
  %806 = bitcast double* %805 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %806, align 8, !tbaa !2
  %807 = add nuw nsw i64 %789, 12
  %808 = or i64 %807, 1
  %809 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %808
  %810 = bitcast double* %809 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %810, align 8, !tbaa !2
  %811 = getelementptr double, double* %809, i64 2
  %812 = bitcast double* %811 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %812, align 8, !tbaa !2
  %813 = add nuw nsw i64 %789, 16
  %814 = or i64 %813, 1
  %815 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %814
  %816 = bitcast double* %815 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %816, align 8, !tbaa !2
  %817 = getelementptr double, double* %815, i64 2
  %818 = bitcast double* %817 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %818, align 8, !tbaa !2
  %819 = add nuw nsw i64 %789, 20
  %820 = icmp eq i64 %819, 14000
  br i1 %820, label %821, label %788, !llvm.loop !19

; <label>:821:                                    ; preds = %788
  store double 1.000000e+00, double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 14001), align 8, !tbaa !2
  tail call void @timer_clear(i32 1) #6
  tail call void @timer_start(i32 1) #6
  %822 = load i1, i1* @lastcol, align 4
  %823 = load i1, i1* @firstcol, align 4
  br label %824

; <label>:824:                                    ; preds = %992, %821
  %825 = phi i1 [ %823, %821 ], [ %909, %992 ]
  %826 = phi i1 [ %822, %821 ], [ %908, %992 ]
  %827 = phi i32 [ 1, %821 ], [ %993, %992 ]
  call fastcc void @conj_grad(double* nonnull %3)
  %828 = sext i1 %825 to i32
  %829 = select i1 %826, i32 14001, i32 1
  %830 = add nsw i32 %829, %828
  %831 = icmp slt i32 %830, 1
  br i1 %831, label %895, label %832

; <label>:832:                                    ; preds = %824
  %833 = sext i32 %830 to i64
  %834 = icmp ult i32 %830, 4
  br i1 %834, label %877, label %835

; <label>:835:                                    ; preds = %832
  %836 = and i64 %833, -4
  %837 = or i64 %836, 1
  br label %838

; <label>:838:                                    ; preds = %838, %835
  %839 = phi i64 [ 0, %835 ], [ %865, %838 ]
  %840 = phi <2 x double> [ zeroinitializer, %835 ], [ %863, %838 ]
  %841 = phi <2 x double> [ zeroinitializer, %835 ], [ %864, %838 ]
  %842 = phi <2 x double> [ zeroinitializer, %835 ], [ %859, %838 ]
  %843 = phi <2 x double> [ zeroinitializer, %835 ], [ %860, %838 ]
  %844 = or i64 %839, 1
  %845 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %844
  %846 = bitcast double* %845 to <2 x double>*
  %847 = load <2 x double>, <2 x double>* %846, align 8, !tbaa !2
  %848 = getelementptr double, double* %845, i64 2
  %849 = bitcast double* %848 to <2 x double>*
  %850 = load <2 x double>, <2 x double>* %849, align 8, !tbaa !2
  %851 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %844
  %852 = bitcast double* %851 to <2 x double>*
  %853 = load <2 x double>, <2 x double>* %852, align 8, !tbaa !2
  %854 = getelementptr double, double* %851, i64 2
  %855 = bitcast double* %854 to <2 x double>*
  %856 = load <2 x double>, <2 x double>* %855, align 8, !tbaa !2
  %857 = fmul fast <2 x double> %853, %847
  %858 = fmul fast <2 x double> %856, %850
  %859 = fadd fast <2 x double> %857, %842
  %860 = fadd fast <2 x double> %858, %843
  %861 = fmul fast <2 x double> %853, %853
  %862 = fmul fast <2 x double> %856, %856
  %863 = fadd fast <2 x double> %861, %840
  %864 = fadd fast <2 x double> %862, %841
  %865 = add i64 %839, 4
  %866 = icmp eq i64 %865, %836
  br i1 %866, label %867, label %838, !llvm.loop !20

; <label>:867:                                    ; preds = %838
  %868 = fadd fast <2 x double> %860, %859
  %869 = shufflevector <2 x double> %868, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %870 = fadd fast <2 x double> %868, %869
  %871 = extractelement <2 x double> %870, i32 0
  %872 = fadd fast <2 x double> %864, %863
  %873 = shufflevector <2 x double> %872, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %874 = fadd fast <2 x double> %872, %873
  %875 = extractelement <2 x double> %874, i32 0
  %876 = icmp eq i64 %836, %833
  br i1 %876, label %895, label %877

; <label>:877:                                    ; preds = %867, %832
  %878 = phi i64 [ 1, %832 ], [ %837, %867 ]
  %879 = phi double [ 0.000000e+00, %832 ], [ %875, %867 ]
  %880 = phi double [ 0.000000e+00, %832 ], [ %871, %867 ]
  br label %881

; <label>:881:                                    ; preds = %877, %881
  %882 = phi i64 [ %893, %881 ], [ %878, %877 ]
  %883 = phi double [ %892, %881 ], [ %879, %877 ]
  %884 = phi double [ %890, %881 ], [ %880, %877 ]
  %885 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %882
  %886 = load double, double* %885, align 8, !tbaa !2
  %887 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %882
  %888 = load double, double* %887, align 8, !tbaa !2
  %889 = fmul fast double %888, %886
  %890 = fadd fast double %889, %884
  %891 = fmul fast double %888, %888
  %892 = fadd fast double %891, %883
  %893 = add nuw nsw i64 %882, 1
  %894 = icmp slt i64 %882, %833
  br i1 %894, label %881, label %895, !llvm.loop !21

; <label>:895:                                    ; preds = %881, %867, %824
  %896 = phi double [ 0.000000e+00, %824 ], [ %871, %867 ], [ %890, %881 ]
  %897 = phi double [ 0.000000e+00, %824 ], [ %875, %867 ], [ %892, %881 ]
  %898 = tail call fast double @llvm.sqrt.f64(double %897)
  %899 = fdiv fast double 1.000000e+00, %898
  %900 = fdiv fast double 1.000000e+00, %896
  %901 = fadd fast double %900, 2.000000e+01
  %902 = icmp eq i32 %827, 1
  br i1 %902, label %903, label %905

; <label>:903:                                    ; preds = %895
  %904 = tail call i32 @puts(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @str.30, i64 0, i64 0))
  br label %905

; <label>:905:                                    ; preds = %903, %895
  %906 = load double, double* %3, align 8, !tbaa !2
  %907 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i32 %827, double %906, double %901)
  %908 = load i1, i1* @lastcol, align 4
  %909 = load i1, i1* @firstcol, align 4
  %910 = sext i1 %909 to i32
  %911 = select i1 %908, i32 14001, i32 1
  %912 = add nsw i32 %911, %910
  %913 = icmp slt i32 %912, 1
  br i1 %913, label %992, label %914

; <label>:914:                                    ; preds = %905
  %915 = sext i32 %912 to i64
  %916 = icmp ult i32 %912, 4
  br i1 %916, label %982, label %917

; <label>:917:                                    ; preds = %914
  %918 = and i64 %915, -4
  %919 = or i64 %918, 1
  %920 = insertelement <2 x double> undef, double %899, i32 0
  %921 = shufflevector <2 x double> %920, <2 x double> undef, <2 x i32> zeroinitializer
  %922 = insertelement <2 x double> undef, double %899, i32 0
  %923 = shufflevector <2 x double> %922, <2 x double> undef, <2 x i32> zeroinitializer
  %924 = add nsw i64 %918, -4
  %925 = lshr exact i64 %924, 2
  %926 = add nuw nsw i64 %925, 1
  %927 = and i64 %926, 1
  %928 = icmp eq i64 %924, 0
  br i1 %928, label %963, label %929

; <label>:929:                                    ; preds = %917
  %930 = sub nsw i64 %926, %927
  br label %931

; <label>:931:                                    ; preds = %931, %929
  %932 = phi i64 [ 0, %929 ], [ %960, %931 ]
  %933 = phi i64 [ %930, %929 ], [ %961, %931 ]
  %934 = or i64 %932, 1
  %935 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %934
  %936 = bitcast double* %935 to <2 x double>*
  %937 = load <2 x double>, <2 x double>* %936, align 8, !tbaa !2
  %938 = getelementptr double, double* %935, i64 2
  %939 = bitcast double* %938 to <2 x double>*
  %940 = load <2 x double>, <2 x double>* %939, align 8, !tbaa !2
  %941 = fmul fast <2 x double> %937, %921
  %942 = fmul fast <2 x double> %940, %923
  %943 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %934
  %944 = bitcast double* %943 to <2 x double>*
  store <2 x double> %941, <2 x double>* %944, align 8, !tbaa !2
  %945 = getelementptr double, double* %943, i64 2
  %946 = bitcast double* %945 to <2 x double>*
  store <2 x double> %942, <2 x double>* %946, align 8, !tbaa !2
  %947 = or i64 %932, 5
  %948 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %947
  %949 = bitcast double* %948 to <2 x double>*
  %950 = load <2 x double>, <2 x double>* %949, align 8, !tbaa !2
  %951 = getelementptr double, double* %948, i64 2
  %952 = bitcast double* %951 to <2 x double>*
  %953 = load <2 x double>, <2 x double>* %952, align 8, !tbaa !2
  %954 = fmul fast <2 x double> %950, %921
  %955 = fmul fast <2 x double> %953, %923
  %956 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %947
  %957 = bitcast double* %956 to <2 x double>*
  store <2 x double> %954, <2 x double>* %957, align 8, !tbaa !2
  %958 = getelementptr double, double* %956, i64 2
  %959 = bitcast double* %958 to <2 x double>*
  store <2 x double> %955, <2 x double>* %959, align 8, !tbaa !2
  %960 = add i64 %932, 8
  %961 = add i64 %933, -2
  %962 = icmp eq i64 %961, 0
  br i1 %962, label %963, label %931, !llvm.loop !22

; <label>:963:                                    ; preds = %931, %917
  %964 = phi i64 [ 0, %917 ], [ %960, %931 ]
  %965 = icmp eq i64 %927, 0
  br i1 %965, label %980, label %966

; <label>:966:                                    ; preds = %963
  %967 = or i64 %964, 1
  %968 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %967
  %969 = bitcast double* %968 to <2 x double>*
  %970 = load <2 x double>, <2 x double>* %969, align 8, !tbaa !2
  %971 = getelementptr double, double* %968, i64 2
  %972 = bitcast double* %971 to <2 x double>*
  %973 = load <2 x double>, <2 x double>* %972, align 8, !tbaa !2
  %974 = fmul fast <2 x double> %970, %921
  %975 = fmul fast <2 x double> %973, %923
  %976 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %967
  %977 = bitcast double* %976 to <2 x double>*
  store <2 x double> %974, <2 x double>* %977, align 8, !tbaa !2
  %978 = getelementptr double, double* %976, i64 2
  %979 = bitcast double* %978 to <2 x double>*
  store <2 x double> %975, <2 x double>* %979, align 8, !tbaa !2
  br label %980

; <label>:980:                                    ; preds = %963, %966
  %981 = icmp eq i64 %918, %915
  br i1 %981, label %992, label %982

; <label>:982:                                    ; preds = %980, %914
  %983 = phi i64 [ 1, %914 ], [ %919, %980 ]
  br label %984

; <label>:984:                                    ; preds = %982, %984
  %985 = phi i64 [ %990, %984 ], [ %983, %982 ]
  %986 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %985
  %987 = load double, double* %986, align 8, !tbaa !2
  %988 = fmul fast double %987, %899
  %989 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %985
  store double %988, double* %989, align 8, !tbaa !2
  %990 = add nuw nsw i64 %985, 1
  %991 = icmp slt i64 %985, %915
  br i1 %991, label %984, label %992, !llvm.loop !23

; <label>:992:                                    ; preds = %984, %980, %905
  %993 = add nuw nsw i32 %827, 1
  %994 = icmp eq i32 %993, 16
  br i1 %994, label %995, label %824

; <label>:995:                                    ; preds = %992
  tail call void @timer_stop(i32 1) #6
  %996 = tail call fast double @timer_read(i32 1) #6
  %997 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.27, i64 0, i64 0))
  %998 = fadd fast double %900, 0x4006F54752F138A0
  %999 = tail call fast double @llvm.fabs.f64(double %998)
  %1000 = fcmp fast ugt double %999, 1.000000e-10
  br i1 %1000, label %1005, label %1001

; <label>:1001:                                   ; preds = %995
  %1002 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.29, i64 0, i64 0))
  %1003 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), double %901)
  %1004 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i64 0, i64 0), double %998)
  br label %1009

; <label>:1005:                                   ; preds = %995
  %1006 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.28, i64 0, i64 0))
  %1007 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i64 0, i64 0), double %901)
  %1008 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), double 0x4031215715A1D8EC)
  br label %1009

; <label>:1009:                                   ; preds = %1001, %1005
  %1010 = phi i32 [ 1, %1001 ], [ 0, %1005 ]
  %1011 = fcmp fast une double %996, 0.000000e+00
  %1012 = fdiv fast double 1.496460e+03, %996
  %1013 = select i1 %1011, double %1012, double 0.000000e+00
  tail call void @c_print_results(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i64 0, i64 0), i8 signext 65, i32 14000, i32 0, i32 0, i32 15, i32 1, double %996, double %1013, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.15, i64 0, i64 0), i32 %1010, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.23, i64 0, i64 0)) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #6
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare double @randlc(double*, double) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @conj_grad(double* nocapture) unnamed_addr #0 {
  %2 = load i1, i1* @naa, align 4
  %3 = select i1 %2, i64 112008, i64 8
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i64 0, i64 1) to i8*), i8 0, i64 %3, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i64 0, i64 1) to i8*), i8 0, i64 %3, i32 8, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i64 0, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 1) to i8*), i64 %3, i32 8, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i64 0, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 1) to i8*), i64 %3, i32 8, i1 false)
  %4 = load i1, i1* @lastcol, align 4
  %5 = select i1 %4, i32 14000, i32 0
  %6 = load i1, i1* @firstcol, align 4
  %7 = zext i1 %6 to i32
  %8 = sub nsw i32 %5, %7
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %73, label %10

; <label>:10:                                     ; preds = %1
  %11 = sext i32 %8 to i64
  %12 = or i32 %5, 1
  %13 = zext i32 %12 to i64
  %14 = zext i1 %6 to i64
  %15 = sub nsw i64 %13, %14
  %16 = icmp sgt i64 %15, 1
  %17 = select i1 %16, i64 %15, i64 1
  %18 = icmp ult i64 %17, 4
  br i1 %18, label %61, label %19

; <label>:19:                                     ; preds = %10
  %20 = and i64 %17, 14000
  %21 = or i64 %20, 1
  %22 = add nsw i64 %20, -4
  %23 = lshr exact i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  br label %25

; <label>:25:                                     ; preds = %25, %19
  %26 = phi i64 [ 0, %19 ], [ %52, %25 ]
  %27 = phi <2 x double> [ zeroinitializer, %19 ], [ %50, %25 ]
  %28 = phi <2 x double> [ zeroinitializer, %19 ], [ %51, %25 ]
  %29 = phi i64 [ %24, %19 ], [ %53, %25 ]
  %30 = or i64 %26, 1
  %31 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %32, align 8, !tbaa !2
  %34 = getelementptr double, double* %31, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %35, align 8, !tbaa !2
  %37 = fmul fast <2 x double> %33, %33
  %38 = fmul fast <2 x double> %36, %36
  %39 = fadd fast <2 x double> %37, %27
  %40 = fadd fast <2 x double> %38, %28
  %41 = or i64 %26, 5
  %42 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  %44 = load <2 x double>, <2 x double>* %43, align 8, !tbaa !2
  %45 = getelementptr double, double* %42, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8, !tbaa !2
  %48 = fmul fast <2 x double> %44, %44
  %49 = fmul fast <2 x double> %47, %47
  %50 = fadd fast <2 x double> %48, %39
  %51 = fadd fast <2 x double> %49, %40
  %52 = add i64 %26, 8
  %53 = add i64 %29, -2
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %25, !llvm.loop !24

; <label>:55:                                     ; preds = %25
  %56 = fadd fast <2 x double> %51, %50
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %58 = fadd fast <2 x double> %56, %57
  %59 = extractelement <2 x double> %58, i32 0
  %60 = icmp eq i64 %17, %20
  br i1 %60, label %73, label %61

; <label>:61:                                     ; preds = %55, %10
  %62 = phi i64 [ 1, %10 ], [ %21, %55 ]
  %63 = phi double [ 0.000000e+00, %10 ], [ %59, %55 ]
  br label %64

; <label>:64:                                     ; preds = %61, %64
  %65 = phi i64 [ %71, %64 ], [ %62, %61 ]
  %66 = phi double [ %70, %64 ], [ %63, %61 ]
  %67 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %65
  %68 = load double, double* %67, align 8, !tbaa !2
  %69 = fmul fast double %68, %68
  %70 = fadd fast double %69, %66
  %71 = add nuw nsw i64 %65, 1
  %72 = icmp sgt i64 %65, %11
  br i1 %72, label %73, label %64, !llvm.loop !25

; <label>:73:                                     ; preds = %64, %55, %1
  %74 = phi double [ 0.000000e+00, %1 ], [ %59, %55 ], [ %70, %64 ]
  %75 = load i1, i1* @lastrow, align 4
  %76 = load i1, i1* @firstrow, align 4
  %77 = sext i1 %76 to i32
  %78 = select i1 %75, i32 14001, i32 1
  %79 = add nsw i32 %78, %77
  %80 = icmp slt i32 %79, 1
  %81 = load i32, i32* @conj_grad.callcount, align 4, !tbaa !6
  br i1 %80, label %82, label %337

; <label>:82:                                     ; preds = %73
  %83 = sext i32 %8 to i64
  %84 = or i32 %5, 1
  %85 = zext i32 %84 to i64
  %86 = zext i1 %6 to i64
  %87 = sub nsw i64 %85, %86
  %88 = icmp sgt i64 %87, 1
  %89 = select i1 %88, i64 %87, i64 1
  %90 = or i32 %5, 1
  %91 = zext i32 %90 to i64
  %92 = zext i1 %6 to i64
  %93 = sub nsw i64 %91, %92
  %94 = icmp sgt i64 %93, 1
  %95 = select i1 %94, i64 %93, i64 1
  %96 = or i32 %5, 1
  %97 = zext i32 %96 to i64
  %98 = zext i1 %6 to i64
  %99 = sub nsw i64 %97, %98
  %100 = icmp sgt i64 %99, 1
  %101 = select i1 %100, i64 %99, i64 1
  %102 = and i64 %101, 14000
  %103 = add nsw i64 %102, -4
  %104 = lshr exact i64 %103, 2
  %105 = add nuw nsw i64 %104, 1
  %106 = icmp ult i64 %101, 4
  %107 = and i64 %101, 14000
  %108 = or i64 %107, 1
  %109 = icmp ult i64 %95, 4
  %110 = and i64 %95, 14000
  %111 = or i64 %110, 1
  %112 = icmp eq i64 %101, %107
  %113 = icmp ult i64 %89, 4
  %114 = and i64 %89, 14000
  %115 = or i64 %114, 1
  %116 = icmp eq i64 %95, %110
  %117 = icmp eq i64 %89, %114
  br label %118

; <label>:118:                                    ; preds = %167, %82
  %119 = phi i32 [ 1, %82 ], [ %169, %167 ]
  %120 = phi double [ %74, %82 ], [ %168, %167 ]
  br i1 %9, label %167, label %171

; <label>:121:                                    ; preds = %172, %121
  %122 = phi i64 [ %130, %121 ], [ %173, %172 ]
  %123 = phi double [ %129, %121 ], [ %174, %172 ]
  %124 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %122
  %125 = load double, double* %124, align 8, !tbaa !2
  %126 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %122
  %127 = load double, double* %126, align 8, !tbaa !2
  %128 = fmul fast double %127, %125
  %129 = fadd fast double %128, %123
  %130 = add nuw nsw i64 %122, 1
  %131 = icmp sgt i64 %122, %83
  br i1 %131, label %132, label %121, !llvm.loop !26

; <label>:132:                                    ; preds = %121, %218
  %133 = phi double [ %222, %218 ], [ %129, %121 ]
  %134 = fdiv fast double %120, %133
  br i1 %9, label %167, label %223

; <label>:135:                                    ; preds = %224, %135
  %136 = phi i64 [ %152, %135 ], [ %225, %224 ]
  %137 = phi double [ %151, %135 ], [ %226, %224 ]
  %138 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %136
  %139 = load double, double* %138, align 8, !tbaa !2
  %140 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %136
  %141 = load double, double* %140, align 8, !tbaa !2
  %142 = fmul fast double %141, %134
  %143 = fadd fast double %142, %139
  store double %143, double* %138, align 8, !tbaa !2
  %144 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %136
  %145 = load double, double* %144, align 8, !tbaa !2
  %146 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %136
  %147 = load double, double* %146, align 8, !tbaa !2
  %148 = fmul fast double %147, %134
  %149 = fsub fast double %145, %148
  store double %149, double* %144, align 8, !tbaa !2
  %150 = fmul fast double %149, %149
  %151 = fadd fast double %150, %137
  %152 = add nuw nsw i64 %136, 1
  %153 = icmp sgt i64 %136, %83
  br i1 %153, label %154, label %135, !llvm.loop !27

; <label>:154:                                    ; preds = %135, %279
  %155 = phi double [ %283, %279 ], [ %151, %135 ]
  %156 = fdiv fast double %155, %120
  br i1 %9, label %167, label %284

; <label>:157:                                    ; preds = %285, %157
  %158 = phi i64 [ %165, %157 ], [ %286, %285 ]
  %159 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %158
  %160 = load double, double* %159, align 8, !tbaa !2
  %161 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %158
  %162 = load double, double* %161, align 8, !tbaa !2
  %163 = fmul fast double %162, %156
  %164 = fadd fast double %163, %160
  store double %164, double* %161, align 8, !tbaa !2
  %165 = add nuw nsw i64 %158, 1
  %166 = icmp sgt i64 %158, %83
  br i1 %166, label %167, label %157, !llvm.loop !28

; <label>:167:                                    ; preds = %157, %336, %118, %132, %154
  %168 = phi double [ %155, %154 ], [ 0.000000e+00, %132 ], [ 0.000000e+00, %118 ], [ %155, %336 ], [ %155, %157 ]
  %169 = add nuw nsw i32 %119, 1
  %170 = icmp eq i32 %169, 26
  br i1 %170, label %681, label %118

; <label>:171:                                    ; preds = %118
  br i1 %106, label %172, label %175

; <label>:172:                                    ; preds = %218, %171
  %173 = phi i64 [ 1, %171 ], [ %108, %218 ]
  %174 = phi double [ 0.000000e+00, %171 ], [ %222, %218 ]
  br label %121

; <label>:175:                                    ; preds = %171
  br label %176

; <label>:176:                                    ; preds = %176, %175
  %177 = phi i64 [ 0, %175 ], [ %215, %176 ]
  %178 = phi <2 x double> [ zeroinitializer, %175 ], [ %213, %176 ]
  %179 = phi <2 x double> [ zeroinitializer, %175 ], [ %214, %176 ]
  %180 = phi i64 [ %105, %175 ], [ %216, %176 ]
  %181 = or i64 %177, 1
  %182 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %181
  %183 = bitcast double* %182 to <2 x double>*
  %184 = load <2 x double>, <2 x double>* %183, align 8, !tbaa !2
  %185 = getelementptr double, double* %182, i64 2
  %186 = bitcast double* %185 to <2 x double>*
  %187 = load <2 x double>, <2 x double>* %186, align 8, !tbaa !2
  %188 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %181
  %189 = bitcast double* %188 to <2 x double>*
  %190 = load <2 x double>, <2 x double>* %189, align 8, !tbaa !2
  %191 = getelementptr double, double* %188, i64 2
  %192 = bitcast double* %191 to <2 x double>*
  %193 = load <2 x double>, <2 x double>* %192, align 8, !tbaa !2
  %194 = fmul fast <2 x double> %190, %184
  %195 = fmul fast <2 x double> %193, %187
  %196 = fadd fast <2 x double> %194, %178
  %197 = fadd fast <2 x double> %195, %179
  %198 = or i64 %177, 5
  %199 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %198
  %200 = bitcast double* %199 to <2 x double>*
  %201 = load <2 x double>, <2 x double>* %200, align 8, !tbaa !2
  %202 = getelementptr double, double* %199, i64 2
  %203 = bitcast double* %202 to <2 x double>*
  %204 = load <2 x double>, <2 x double>* %203, align 8, !tbaa !2
  %205 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %198
  %206 = bitcast double* %205 to <2 x double>*
  %207 = load <2 x double>, <2 x double>* %206, align 8, !tbaa !2
  %208 = getelementptr double, double* %205, i64 2
  %209 = bitcast double* %208 to <2 x double>*
  %210 = load <2 x double>, <2 x double>* %209, align 8, !tbaa !2
  %211 = fmul fast <2 x double> %207, %201
  %212 = fmul fast <2 x double> %210, %204
  %213 = fadd fast <2 x double> %211, %196
  %214 = fadd fast <2 x double> %212, %197
  %215 = add i64 %177, 8
  %216 = add i64 %180, -2
  %217 = icmp eq i64 %216, 0
  br i1 %217, label %218, label %176, !llvm.loop !29

; <label>:218:                                    ; preds = %176
  %219 = fadd fast <2 x double> %214, %213
  %220 = shufflevector <2 x double> %219, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %221 = fadd fast <2 x double> %219, %220
  %222 = extractelement <2 x double> %221, i32 0
  br i1 %112, label %132, label %172

; <label>:223:                                    ; preds = %132
  br i1 %109, label %224, label %227

; <label>:224:                                    ; preds = %279, %223
  %225 = phi i64 [ 1, %223 ], [ %111, %279 ]
  %226 = phi double [ 0.000000e+00, %223 ], [ %283, %279 ]
  br label %135

; <label>:227:                                    ; preds = %223
  %228 = insertelement <2 x double> undef, double %134, i32 0
  %229 = shufflevector <2 x double> %228, <2 x double> undef, <2 x i32> zeroinitializer
  %230 = insertelement <2 x double> undef, double %134, i32 0
  %231 = shufflevector <2 x double> %230, <2 x double> undef, <2 x i32> zeroinitializer
  br label %232

; <label>:232:                                    ; preds = %232, %227
  %233 = phi i64 [ 0, %227 ], [ %277, %232 ]
  %234 = phi <2 x double> [ zeroinitializer, %227 ], [ %275, %232 ]
  %235 = phi <2 x double> [ zeroinitializer, %227 ], [ %276, %232 ]
  %236 = or i64 %233, 1
  %237 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %236
  %238 = bitcast double* %237 to <2 x double>*
  %239 = load <2 x double>, <2 x double>* %238, align 8, !tbaa !2
  %240 = getelementptr double, double* %237, i64 2
  %241 = bitcast double* %240 to <2 x double>*
  %242 = load <2 x double>, <2 x double>* %241, align 8, !tbaa !2
  %243 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %236
  %244 = bitcast double* %243 to <2 x double>*
  %245 = load <2 x double>, <2 x double>* %244, align 8, !tbaa !2
  %246 = getelementptr double, double* %243, i64 2
  %247 = bitcast double* %246 to <2 x double>*
  %248 = load <2 x double>, <2 x double>* %247, align 8, !tbaa !2
  %249 = fmul fast <2 x double> %245, %229
  %250 = fmul fast <2 x double> %248, %231
  %251 = fadd fast <2 x double> %249, %239
  %252 = fadd fast <2 x double> %250, %242
  %253 = bitcast double* %237 to <2 x double>*
  store <2 x double> %251, <2 x double>* %253, align 8, !tbaa !2
  %254 = bitcast double* %240 to <2 x double>*
  store <2 x double> %252, <2 x double>* %254, align 8, !tbaa !2
  %255 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %236
  %256 = bitcast double* %255 to <2 x double>*
  %257 = load <2 x double>, <2 x double>* %256, align 8, !tbaa !2
  %258 = getelementptr double, double* %255, i64 2
  %259 = bitcast double* %258 to <2 x double>*
  %260 = load <2 x double>, <2 x double>* %259, align 8, !tbaa !2
  %261 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %236
  %262 = bitcast double* %261 to <2 x double>*
  %263 = load <2 x double>, <2 x double>* %262, align 8, !tbaa !2
  %264 = getelementptr double, double* %261, i64 2
  %265 = bitcast double* %264 to <2 x double>*
  %266 = load <2 x double>, <2 x double>* %265, align 8, !tbaa !2
  %267 = fmul fast <2 x double> %263, %229
  %268 = fmul fast <2 x double> %266, %231
  %269 = fsub fast <2 x double> %257, %267
  %270 = fsub fast <2 x double> %260, %268
  %271 = bitcast double* %255 to <2 x double>*
  store <2 x double> %269, <2 x double>* %271, align 8, !tbaa !2
  %272 = bitcast double* %258 to <2 x double>*
  store <2 x double> %270, <2 x double>* %272, align 8, !tbaa !2
  %273 = fmul fast <2 x double> %269, %269
  %274 = fmul fast <2 x double> %270, %270
  %275 = fadd fast <2 x double> %273, %234
  %276 = fadd fast <2 x double> %274, %235
  %277 = add i64 %233, 4
  %278 = icmp eq i64 %277, %110
  br i1 %278, label %279, label %232, !llvm.loop !30

; <label>:279:                                    ; preds = %232
  %280 = fadd fast <2 x double> %276, %275
  %281 = shufflevector <2 x double> %280, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %282 = fadd fast <2 x double> %280, %281
  %283 = extractelement <2 x double> %282, i32 0
  br i1 %116, label %154, label %224

; <label>:284:                                    ; preds = %154
  br i1 %113, label %285, label %287

; <label>:285:                                    ; preds = %336, %284
  %286 = phi i64 [ 1, %284 ], [ %115, %336 ]
  br label %157

; <label>:287:                                    ; preds = %284
  %288 = insertelement <2 x double> undef, double %156, i32 0
  %289 = shufflevector <2 x double> %288, <2 x double> undef, <2 x i32> zeroinitializer
  %290 = insertelement <2 x double> undef, double %156, i32 0
  %291 = shufflevector <2 x double> %290, <2 x double> undef, <2 x i32> zeroinitializer
  br label %292

; <label>:292:                                    ; preds = %292, %287
  %293 = phi i64 [ 0, %287 ], [ %333, %292 ]
  %294 = phi i64 [ %105, %287 ], [ %334, %292 ]
  %295 = or i64 %293, 1
  %296 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %295
  %297 = bitcast double* %296 to <2 x double>*
  %298 = load <2 x double>, <2 x double>* %297, align 8, !tbaa !2
  %299 = getelementptr double, double* %296, i64 2
  %300 = bitcast double* %299 to <2 x double>*
  %301 = load <2 x double>, <2 x double>* %300, align 8, !tbaa !2
  %302 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %295
  %303 = bitcast double* %302 to <2 x double>*
  %304 = load <2 x double>, <2 x double>* %303, align 8, !tbaa !2
  %305 = getelementptr double, double* %302, i64 2
  %306 = bitcast double* %305 to <2 x double>*
  %307 = load <2 x double>, <2 x double>* %306, align 8, !tbaa !2
  %308 = fmul fast <2 x double> %304, %289
  %309 = fmul fast <2 x double> %307, %291
  %310 = fadd fast <2 x double> %308, %298
  %311 = fadd fast <2 x double> %309, %301
  %312 = bitcast double* %302 to <2 x double>*
  store <2 x double> %310, <2 x double>* %312, align 8, !tbaa !2
  %313 = bitcast double* %305 to <2 x double>*
  store <2 x double> %311, <2 x double>* %313, align 8, !tbaa !2
  %314 = or i64 %293, 5
  %315 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %314
  %316 = bitcast double* %315 to <2 x double>*
  %317 = load <2 x double>, <2 x double>* %316, align 8, !tbaa !2
  %318 = getelementptr double, double* %315, i64 2
  %319 = bitcast double* %318 to <2 x double>*
  %320 = load <2 x double>, <2 x double>* %319, align 8, !tbaa !2
  %321 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %314
  %322 = bitcast double* %321 to <2 x double>*
  %323 = load <2 x double>, <2 x double>* %322, align 8, !tbaa !2
  %324 = getelementptr double, double* %321, i64 2
  %325 = bitcast double* %324 to <2 x double>*
  %326 = load <2 x double>, <2 x double>* %325, align 8, !tbaa !2
  %327 = fmul fast <2 x double> %323, %289
  %328 = fmul fast <2 x double> %326, %291
  %329 = fadd fast <2 x double> %327, %317
  %330 = fadd fast <2 x double> %328, %320
  %331 = bitcast double* %321 to <2 x double>*
  store <2 x double> %329, <2 x double>* %331, align 8, !tbaa !2
  %332 = bitcast double* %324 to <2 x double>*
  store <2 x double> %330, <2 x double>* %332, align 8, !tbaa !2
  %333 = add i64 %293, 8
  %334 = add i64 %294, -2
  %335 = icmp eq i64 %334, 0
  br i1 %335, label %336, label %292, !llvm.loop !31

; <label>:336:                                    ; preds = %292
  br i1 %117, label %167, label %285

; <label>:337:                                    ; preds = %73
  %338 = sext i32 %79 to i64
  %339 = sext i32 %8 to i64
  %340 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  %341 = or i32 %5, 1
  %342 = zext i32 %341 to i64
  %343 = zext i1 %6 to i64
  %344 = sub nsw i64 %342, %343
  %345 = icmp sgt i64 %344, 1
  %346 = select i1 %345, i64 %344, i64 1
  %347 = or i32 %5, 1
  %348 = zext i32 %347 to i64
  %349 = zext i1 %6 to i64
  %350 = sub nsw i64 %348, %349
  %351 = icmp sgt i64 %350, 1
  %352 = select i1 %351, i64 %350, i64 1
  %353 = or i32 %5, 1
  %354 = zext i32 %353 to i64
  %355 = zext i1 %6 to i64
  %356 = sub nsw i64 %354, %355
  %357 = icmp sgt i64 %356, 1
  %358 = select i1 %357, i64 %356, i64 1
  %359 = and i64 %358, 14000
  %360 = add nsw i64 %359, -4
  %361 = lshr exact i64 %360, 2
  %362 = add nuw nsw i64 %361, 1
  %363 = icmp ult i64 %358, 4
  %364 = and i64 %358, 14000
  %365 = or i64 %364, 1
  %366 = icmp ult i64 %352, 4
  %367 = and i64 %352, 14000
  %368 = or i64 %367, 1
  %369 = icmp eq i64 %358, %364
  %370 = icmp ult i64 %346, 4
  %371 = and i64 %346, 14000
  %372 = or i64 %371, 1
  %373 = icmp eq i64 %352, %367
  %374 = icmp eq i64 %346, %371
  br label %375

; <label>:375:                                    ; preds = %677, %337
  %376 = phi i32 [ 1, %337 ], [ %679, %677 ]
  %377 = phi double [ %74, %337 ], [ %678, %677 ]
  br label %378

; <label>:378:                                    ; preds = %460, %375
  %379 = phi i32 [ %383, %460 ], [ %340, %375 ]
  %380 = phi i64 [ %381, %460 ], [ 1, %375 ]
  %381 = add nuw nsw i64 %380, 1
  %382 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %381
  %383 = load i32, i32* %382, align 4, !tbaa !6
  %384 = icmp slt i32 %379, %383
  br i1 %384, label %385, label %460

; <label>:385:                                    ; preds = %378
  %386 = sext i32 %379 to i64
  %387 = sext i32 %383 to i64
  %388 = sub nsw i64 %387, %386
  %389 = add nsw i64 %387, -1
  %390 = sub nsw i64 %389, %386
  %391 = and i64 %388, 3
  %392 = icmp eq i64 %391, 0
  br i1 %392, label %410, label %393

; <label>:393:                                    ; preds = %385
  br label %394

; <label>:394:                                    ; preds = %394, %393
  %395 = phi i64 [ %386, %393 ], [ %407, %394 ]
  %396 = phi double [ 0.000000e+00, %393 ], [ %406, %394 ]
  %397 = phi i64 [ %391, %393 ], [ %408, %394 ]
  %398 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %395
  %399 = load double, double* %398, align 8, !tbaa !2
  %400 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %395
  %401 = load i32, i32* %400, align 4, !tbaa !6
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %402
  %404 = load double, double* %403, align 8, !tbaa !2
  %405 = fmul fast double %404, %399
  %406 = fadd fast double %405, %396
  %407 = add nsw i64 %395, 1
  %408 = add i64 %397, -1
  %409 = icmp eq i64 %408, 0
  br i1 %409, label %410, label %394, !llvm.loop !32

; <label>:410:                                    ; preds = %394, %385
  %411 = phi i64 [ %386, %385 ], [ %407, %394 ]
  %412 = phi double [ 0.000000e+00, %385 ], [ %406, %394 ]
  %413 = phi double [ undef, %385 ], [ %406, %394 ]
  %414 = icmp ult i64 %390, 3
  br i1 %414, label %460, label %415

; <label>:415:                                    ; preds = %410
  br label %416

; <label>:416:                                    ; preds = %416, %415
  %417 = phi i64 [ %411, %415 ], [ %458, %416 ]
  %418 = phi double [ %412, %415 ], [ %457, %416 ]
  %419 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %417
  %420 = load double, double* %419, align 8, !tbaa !2
  %421 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %417
  %422 = load i32, i32* %421, align 4, !tbaa !6
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %423
  %425 = load double, double* %424, align 8, !tbaa !2
  %426 = fmul fast double %425, %420
  %427 = fadd fast double %426, %418
  %428 = add nsw i64 %417, 1
  %429 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %428
  %430 = load double, double* %429, align 8, !tbaa !2
  %431 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %428
  %432 = load i32, i32* %431, align 4, !tbaa !6
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %433
  %435 = load double, double* %434, align 8, !tbaa !2
  %436 = fmul fast double %435, %430
  %437 = fadd fast double %436, %427
  %438 = add nsw i64 %417, 2
  %439 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %438
  %440 = load double, double* %439, align 8, !tbaa !2
  %441 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %438
  %442 = load i32, i32* %441, align 4, !tbaa !6
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %443
  %445 = load double, double* %444, align 8, !tbaa !2
  %446 = fmul fast double %445, %440
  %447 = fadd fast double %446, %437
  %448 = add nsw i64 %417, 3
  %449 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %448
  %450 = load double, double* %449, align 8, !tbaa !2
  %451 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %448
  %452 = load i32, i32* %451, align 4, !tbaa !6
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %453
  %455 = load double, double* %454, align 8, !tbaa !2
  %456 = fmul fast double %455, %450
  %457 = fadd fast double %456, %447
  %458 = add nsw i64 %417, 4
  %459 = icmp slt i64 %458, %387
  br i1 %459, label %416, label %460

; <label>:460:                                    ; preds = %410, %416, %378
  %461 = phi double [ 0.000000e+00, %378 ], [ %413, %410 ], [ %457, %416 ]
  %462 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %380
  store double %461, double* %462, align 8, !tbaa !2
  %463 = icmp slt i64 %380, %338
  br i1 %463, label %378, label %464

; <label>:464:                                    ; preds = %460
  br i1 %9, label %677, label %465

; <label>:465:                                    ; preds = %464
  br i1 %363, label %514, label %466

; <label>:466:                                    ; preds = %465
  br label %467

; <label>:467:                                    ; preds = %467, %466
  %468 = phi i64 [ 0, %466 ], [ %506, %467 ]
  %469 = phi <2 x double> [ zeroinitializer, %466 ], [ %504, %467 ]
  %470 = phi <2 x double> [ zeroinitializer, %466 ], [ %505, %467 ]
  %471 = phi i64 [ %362, %466 ], [ %507, %467 ]
  %472 = or i64 %468, 1
  %473 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %472
  %474 = bitcast double* %473 to <2 x double>*
  %475 = load <2 x double>, <2 x double>* %474, align 8, !tbaa !2
  %476 = getelementptr double, double* %473, i64 2
  %477 = bitcast double* %476 to <2 x double>*
  %478 = load <2 x double>, <2 x double>* %477, align 8, !tbaa !2
  %479 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %472
  %480 = bitcast double* %479 to <2 x double>*
  %481 = load <2 x double>, <2 x double>* %480, align 8, !tbaa !2
  %482 = getelementptr double, double* %479, i64 2
  %483 = bitcast double* %482 to <2 x double>*
  %484 = load <2 x double>, <2 x double>* %483, align 8, !tbaa !2
  %485 = fmul fast <2 x double> %481, %475
  %486 = fmul fast <2 x double> %484, %478
  %487 = fadd fast <2 x double> %485, %469
  %488 = fadd fast <2 x double> %486, %470
  %489 = or i64 %468, 5
  %490 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %489
  %491 = bitcast double* %490 to <2 x double>*
  %492 = load <2 x double>, <2 x double>* %491, align 8, !tbaa !2
  %493 = getelementptr double, double* %490, i64 2
  %494 = bitcast double* %493 to <2 x double>*
  %495 = load <2 x double>, <2 x double>* %494, align 8, !tbaa !2
  %496 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %489
  %497 = bitcast double* %496 to <2 x double>*
  %498 = load <2 x double>, <2 x double>* %497, align 8, !tbaa !2
  %499 = getelementptr double, double* %496, i64 2
  %500 = bitcast double* %499 to <2 x double>*
  %501 = load <2 x double>, <2 x double>* %500, align 8, !tbaa !2
  %502 = fmul fast <2 x double> %498, %492
  %503 = fmul fast <2 x double> %501, %495
  %504 = fadd fast <2 x double> %502, %487
  %505 = fadd fast <2 x double> %503, %488
  %506 = add i64 %468, 8
  %507 = add i64 %471, -2
  %508 = icmp eq i64 %507, 0
  br i1 %508, label %509, label %467, !llvm.loop !33

; <label>:509:                                    ; preds = %467
  %510 = fadd fast <2 x double> %505, %504
  %511 = shufflevector <2 x double> %510, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %512 = fadd fast <2 x double> %510, %511
  %513 = extractelement <2 x double> %512, i32 0
  br i1 %369, label %528, label %514

; <label>:514:                                    ; preds = %509, %465
  %515 = phi i64 [ 1, %465 ], [ %365, %509 ]
  %516 = phi double [ 0.000000e+00, %465 ], [ %513, %509 ]
  br label %517

; <label>:517:                                    ; preds = %514, %517
  %518 = phi i64 [ %526, %517 ], [ %515, %514 ]
  %519 = phi double [ %525, %517 ], [ %516, %514 ]
  %520 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %518
  %521 = load double, double* %520, align 8, !tbaa !2
  %522 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %518
  %523 = load double, double* %522, align 8, !tbaa !2
  %524 = fmul fast double %523, %521
  %525 = fadd fast double %524, %519
  %526 = add nuw nsw i64 %518, 1
  %527 = icmp sgt i64 %518, %339
  br i1 %527, label %528, label %517, !llvm.loop !34

; <label>:528:                                    ; preds = %517, %509
  %529 = phi double [ %513, %509 ], [ %525, %517 ]
  %530 = fdiv fast double %377, %529
  br i1 %9, label %677, label %531

; <label>:531:                                    ; preds = %528
  br i1 %366, label %589, label %532

; <label>:532:                                    ; preds = %531
  %533 = insertelement <2 x double> undef, double %530, i32 0
  %534 = shufflevector <2 x double> %533, <2 x double> undef, <2 x i32> zeroinitializer
  %535 = insertelement <2 x double> undef, double %530, i32 0
  %536 = shufflevector <2 x double> %535, <2 x double> undef, <2 x i32> zeroinitializer
  br label %537

; <label>:537:                                    ; preds = %537, %532
  %538 = phi i64 [ 0, %532 ], [ %582, %537 ]
  %539 = phi <2 x double> [ zeroinitializer, %532 ], [ %580, %537 ]
  %540 = phi <2 x double> [ zeroinitializer, %532 ], [ %581, %537 ]
  %541 = or i64 %538, 1
  %542 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %541
  %543 = bitcast double* %542 to <2 x double>*
  %544 = load <2 x double>, <2 x double>* %543, align 8, !tbaa !2
  %545 = getelementptr double, double* %542, i64 2
  %546 = bitcast double* %545 to <2 x double>*
  %547 = load <2 x double>, <2 x double>* %546, align 8, !tbaa !2
  %548 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %541
  %549 = bitcast double* %548 to <2 x double>*
  %550 = load <2 x double>, <2 x double>* %549, align 8, !tbaa !2
  %551 = getelementptr double, double* %548, i64 2
  %552 = bitcast double* %551 to <2 x double>*
  %553 = load <2 x double>, <2 x double>* %552, align 8, !tbaa !2
  %554 = fmul fast <2 x double> %550, %534
  %555 = fmul fast <2 x double> %553, %536
  %556 = fadd fast <2 x double> %554, %544
  %557 = fadd fast <2 x double> %555, %547
  %558 = bitcast double* %542 to <2 x double>*
  store <2 x double> %556, <2 x double>* %558, align 8, !tbaa !2
  %559 = bitcast double* %545 to <2 x double>*
  store <2 x double> %557, <2 x double>* %559, align 8, !tbaa !2
  %560 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %541
  %561 = bitcast double* %560 to <2 x double>*
  %562 = load <2 x double>, <2 x double>* %561, align 8, !tbaa !2
  %563 = getelementptr double, double* %560, i64 2
  %564 = bitcast double* %563 to <2 x double>*
  %565 = load <2 x double>, <2 x double>* %564, align 8, !tbaa !2
  %566 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %541
  %567 = bitcast double* %566 to <2 x double>*
  %568 = load <2 x double>, <2 x double>* %567, align 8, !tbaa !2
  %569 = getelementptr double, double* %566, i64 2
  %570 = bitcast double* %569 to <2 x double>*
  %571 = load <2 x double>, <2 x double>* %570, align 8, !tbaa !2
  %572 = fmul fast <2 x double> %568, %534
  %573 = fmul fast <2 x double> %571, %536
  %574 = fsub fast <2 x double> %562, %572
  %575 = fsub fast <2 x double> %565, %573
  %576 = bitcast double* %560 to <2 x double>*
  store <2 x double> %574, <2 x double>* %576, align 8, !tbaa !2
  %577 = bitcast double* %563 to <2 x double>*
  store <2 x double> %575, <2 x double>* %577, align 8, !tbaa !2
  %578 = fmul fast <2 x double> %574, %574
  %579 = fmul fast <2 x double> %575, %575
  %580 = fadd fast <2 x double> %578, %539
  %581 = fadd fast <2 x double> %579, %540
  %582 = add i64 %538, 4
  %583 = icmp eq i64 %582, %367
  br i1 %583, label %584, label %537, !llvm.loop !35

; <label>:584:                                    ; preds = %537
  %585 = fadd fast <2 x double> %581, %580
  %586 = shufflevector <2 x double> %585, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %587 = fadd fast <2 x double> %585, %586
  %588 = extractelement <2 x double> %587, i32 0
  br i1 %373, label %611, label %589

; <label>:589:                                    ; preds = %584, %531
  %590 = phi i64 [ 1, %531 ], [ %368, %584 ]
  %591 = phi double [ 0.000000e+00, %531 ], [ %588, %584 ]
  br label %592

; <label>:592:                                    ; preds = %589, %592
  %593 = phi i64 [ %609, %592 ], [ %590, %589 ]
  %594 = phi double [ %608, %592 ], [ %591, %589 ]
  %595 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %593
  %596 = load double, double* %595, align 8, !tbaa !2
  %597 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %593
  %598 = load double, double* %597, align 8, !tbaa !2
  %599 = fmul fast double %598, %530
  %600 = fadd fast double %599, %596
  store double %600, double* %595, align 8, !tbaa !2
  %601 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %593
  %602 = load double, double* %601, align 8, !tbaa !2
  %603 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %593
  %604 = load double, double* %603, align 8, !tbaa !2
  %605 = fmul fast double %604, %530
  %606 = fsub fast double %602, %605
  store double %606, double* %601, align 8, !tbaa !2
  %607 = fmul fast double %606, %606
  %608 = fadd fast double %607, %594
  %609 = add nuw nsw i64 %593, 1
  %610 = icmp sgt i64 %593, %339
  br i1 %610, label %611, label %592, !llvm.loop !36

; <label>:611:                                    ; preds = %592, %584
  %612 = phi double [ %588, %584 ], [ %608, %592 ]
  %613 = fdiv fast double %612, %377
  br i1 %9, label %677, label %614

; <label>:614:                                    ; preds = %611
  br i1 %370, label %665, label %615

; <label>:615:                                    ; preds = %614
  %616 = insertelement <2 x double> undef, double %613, i32 0
  %617 = shufflevector <2 x double> %616, <2 x double> undef, <2 x i32> zeroinitializer
  %618 = insertelement <2 x double> undef, double %613, i32 0
  %619 = shufflevector <2 x double> %618, <2 x double> undef, <2 x i32> zeroinitializer
  br label %620

; <label>:620:                                    ; preds = %620, %615
  %621 = phi i64 [ 0, %615 ], [ %661, %620 ]
  %622 = phi i64 [ %362, %615 ], [ %662, %620 ]
  %623 = or i64 %621, 1
  %624 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %623
  %625 = bitcast double* %624 to <2 x double>*
  %626 = load <2 x double>, <2 x double>* %625, align 8, !tbaa !2
  %627 = getelementptr double, double* %624, i64 2
  %628 = bitcast double* %627 to <2 x double>*
  %629 = load <2 x double>, <2 x double>* %628, align 8, !tbaa !2
  %630 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %623
  %631 = bitcast double* %630 to <2 x double>*
  %632 = load <2 x double>, <2 x double>* %631, align 8, !tbaa !2
  %633 = getelementptr double, double* %630, i64 2
  %634 = bitcast double* %633 to <2 x double>*
  %635 = load <2 x double>, <2 x double>* %634, align 8, !tbaa !2
  %636 = fmul fast <2 x double> %632, %617
  %637 = fmul fast <2 x double> %635, %619
  %638 = fadd fast <2 x double> %636, %626
  %639 = fadd fast <2 x double> %637, %629
  %640 = bitcast double* %630 to <2 x double>*
  store <2 x double> %638, <2 x double>* %640, align 8, !tbaa !2
  %641 = bitcast double* %633 to <2 x double>*
  store <2 x double> %639, <2 x double>* %641, align 8, !tbaa !2
  %642 = or i64 %621, 5
  %643 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %642
  %644 = bitcast double* %643 to <2 x double>*
  %645 = load <2 x double>, <2 x double>* %644, align 8, !tbaa !2
  %646 = getelementptr double, double* %643, i64 2
  %647 = bitcast double* %646 to <2 x double>*
  %648 = load <2 x double>, <2 x double>* %647, align 8, !tbaa !2
  %649 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %642
  %650 = bitcast double* %649 to <2 x double>*
  %651 = load <2 x double>, <2 x double>* %650, align 8, !tbaa !2
  %652 = getelementptr double, double* %649, i64 2
  %653 = bitcast double* %652 to <2 x double>*
  %654 = load <2 x double>, <2 x double>* %653, align 8, !tbaa !2
  %655 = fmul fast <2 x double> %651, %617
  %656 = fmul fast <2 x double> %654, %619
  %657 = fadd fast <2 x double> %655, %645
  %658 = fadd fast <2 x double> %656, %648
  %659 = bitcast double* %649 to <2 x double>*
  store <2 x double> %657, <2 x double>* %659, align 8, !tbaa !2
  %660 = bitcast double* %652 to <2 x double>*
  store <2 x double> %658, <2 x double>* %660, align 8, !tbaa !2
  %661 = add i64 %621, 8
  %662 = add i64 %622, -2
  %663 = icmp eq i64 %662, 0
  br i1 %663, label %664, label %620, !llvm.loop !37

; <label>:664:                                    ; preds = %620
  br i1 %374, label %677, label %665

; <label>:665:                                    ; preds = %664, %614
  %666 = phi i64 [ 1, %614 ], [ %372, %664 ]
  br label %667

; <label>:667:                                    ; preds = %665, %667
  %668 = phi i64 [ %675, %667 ], [ %666, %665 ]
  %669 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %668
  %670 = load double, double* %669, align 8, !tbaa !2
  %671 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %668
  %672 = load double, double* %671, align 8, !tbaa !2
  %673 = fmul fast double %672, %613
  %674 = fadd fast double %673, %670
  store double %674, double* %671, align 8, !tbaa !2
  %675 = add nuw nsw i64 %668, 1
  %676 = icmp sgt i64 %668, %339
  br i1 %676, label %677, label %667, !llvm.loop !38

; <label>:677:                                    ; preds = %667, %664, %464, %528, %611
  %678 = phi double [ %612, %611 ], [ 0.000000e+00, %528 ], [ 0.000000e+00, %464 ], [ %612, %664 ], [ %612, %667 ]
  %679 = add nuw nsw i32 %376, 1
  %680 = icmp eq i32 %679, 26
  br i1 %680, label %681, label %375

; <label>:681:                                    ; preds = %677, %167
  %682 = add i32 %81, 25
  store i32 %682, i32* @conj_grad.callcount, align 4, !tbaa !6
  br i1 %80, label %772, label %683

; <label>:683:                                    ; preds = %681
  %684 = sext i32 %79 to i64
  %685 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  br label %686

; <label>:686:                                    ; preds = %768, %683
  %687 = phi i32 [ %691, %768 ], [ %685, %683 ]
  %688 = phi i64 [ %689, %768 ], [ 1, %683 ]
  %689 = add nuw nsw i64 %688, 1
  %690 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %689
  %691 = load i32, i32* %690, align 4, !tbaa !6
  %692 = icmp slt i32 %687, %691
  br i1 %692, label %693, label %768

; <label>:693:                                    ; preds = %686
  %694 = sext i32 %687 to i64
  %695 = sext i32 %691 to i64
  %696 = sub nsw i64 %695, %694
  %697 = add nsw i64 %695, -1
  %698 = sub nsw i64 %697, %694
  %699 = and i64 %696, 3
  %700 = icmp eq i64 %699, 0
  br i1 %700, label %718, label %701

; <label>:701:                                    ; preds = %693
  br label %702

; <label>:702:                                    ; preds = %702, %701
  %703 = phi i64 [ %694, %701 ], [ %715, %702 ]
  %704 = phi double [ 0.000000e+00, %701 ], [ %714, %702 ]
  %705 = phi i64 [ %699, %701 ], [ %716, %702 ]
  %706 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %703
  %707 = load double, double* %706, align 8, !tbaa !2
  %708 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %703
  %709 = load i32, i32* %708, align 4, !tbaa !6
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %710
  %712 = load double, double* %711, align 8, !tbaa !2
  %713 = fmul fast double %712, %707
  %714 = fadd fast double %713, %704
  %715 = add nsw i64 %703, 1
  %716 = add i64 %705, -1
  %717 = icmp eq i64 %716, 0
  br i1 %717, label %718, label %702, !llvm.loop !39

; <label>:718:                                    ; preds = %702, %693
  %719 = phi i64 [ %694, %693 ], [ %715, %702 ]
  %720 = phi double [ 0.000000e+00, %693 ], [ %714, %702 ]
  %721 = phi double [ undef, %693 ], [ %714, %702 ]
  %722 = icmp ult i64 %698, 3
  br i1 %722, label %768, label %723

; <label>:723:                                    ; preds = %718
  br label %724

; <label>:724:                                    ; preds = %724, %723
  %725 = phi i64 [ %719, %723 ], [ %766, %724 ]
  %726 = phi double [ %720, %723 ], [ %765, %724 ]
  %727 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %725
  %728 = load double, double* %727, align 8, !tbaa !2
  %729 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %725
  %730 = load i32, i32* %729, align 4, !tbaa !6
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %731
  %733 = load double, double* %732, align 8, !tbaa !2
  %734 = fmul fast double %733, %728
  %735 = fadd fast double %734, %726
  %736 = add nsw i64 %725, 1
  %737 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %736
  %738 = load double, double* %737, align 8, !tbaa !2
  %739 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %736
  %740 = load i32, i32* %739, align 4, !tbaa !6
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %741
  %743 = load double, double* %742, align 8, !tbaa !2
  %744 = fmul fast double %743, %738
  %745 = fadd fast double %744, %735
  %746 = add nsw i64 %725, 2
  %747 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %746
  %748 = load double, double* %747, align 8, !tbaa !2
  %749 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %746
  %750 = load i32, i32* %749, align 4, !tbaa !6
  %751 = sext i32 %750 to i64
  %752 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %751
  %753 = load double, double* %752, align 8, !tbaa !2
  %754 = fmul fast double %753, %748
  %755 = fadd fast double %754, %745
  %756 = add nsw i64 %725, 3
  %757 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %756
  %758 = load double, double* %757, align 8, !tbaa !2
  %759 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %756
  %760 = load i32, i32* %759, align 4, !tbaa !6
  %761 = sext i32 %760 to i64
  %762 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %761
  %763 = load double, double* %762, align 8, !tbaa !2
  %764 = fmul fast double %763, %758
  %765 = fadd fast double %764, %755
  %766 = add nsw i64 %725, 4
  %767 = icmp slt i64 %766, %695
  br i1 %767, label %724, label %768

; <label>:768:                                    ; preds = %718, %724, %686
  %769 = phi double [ 0.000000e+00, %686 ], [ %721, %718 ], [ %765, %724 ]
  %770 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %688
  store double %769, double* %770, align 8, !tbaa !2
  %771 = icmp slt i64 %688, %684
  br i1 %771, label %686, label %772

; <label>:772:                                    ; preds = %768, %681
  br i1 %9, label %855, label %773

; <label>:773:                                    ; preds = %772
  %774 = sext i32 %8 to i64
  %775 = or i32 %5, 1
  %776 = zext i32 %775 to i64
  %777 = zext i1 %6 to i64
  %778 = sub nsw i64 %776, %777
  %779 = icmp sgt i64 %778, 1
  %780 = select i1 %779, i64 %778, i64 1
  %781 = icmp ult i64 %780, 4
  br i1 %781, label %840, label %782

; <label>:782:                                    ; preds = %773
  %783 = and i64 %780, 14000
  %784 = or i64 %783, 1
  %785 = add nsw i64 %783, -4
  %786 = lshr exact i64 %785, 2
  %787 = add nuw nsw i64 %786, 1
  br label %788

; <label>:788:                                    ; preds = %788, %782
  %789 = phi i64 [ 0, %782 ], [ %831, %788 ]
  %790 = phi <2 x double> [ zeroinitializer, %782 ], [ %829, %788 ]
  %791 = phi <2 x double> [ zeroinitializer, %782 ], [ %830, %788 ]
  %792 = phi i64 [ %787, %782 ], [ %832, %788 ]
  %793 = or i64 %789, 1
  %794 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %793
  %795 = bitcast double* %794 to <2 x double>*
  %796 = load <2 x double>, <2 x double>* %795, align 8, !tbaa !2
  %797 = getelementptr double, double* %794, i64 2
  %798 = bitcast double* %797 to <2 x double>*
  %799 = load <2 x double>, <2 x double>* %798, align 8, !tbaa !2
  %800 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %793
  %801 = bitcast double* %800 to <2 x double>*
  %802 = load <2 x double>, <2 x double>* %801, align 8, !tbaa !2
  %803 = getelementptr double, double* %800, i64 2
  %804 = bitcast double* %803 to <2 x double>*
  %805 = load <2 x double>, <2 x double>* %804, align 8, !tbaa !2
  %806 = fsub fast <2 x double> %796, %802
  %807 = fsub fast <2 x double> %799, %805
  %808 = fmul fast <2 x double> %806, %806
  %809 = fmul fast <2 x double> %807, %807
  %810 = fadd fast <2 x double> %808, %790
  %811 = fadd fast <2 x double> %809, %791
  %812 = or i64 %789, 5
  %813 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %812
  %814 = bitcast double* %813 to <2 x double>*
  %815 = load <2 x double>, <2 x double>* %814, align 8, !tbaa !2
  %816 = getelementptr double, double* %813, i64 2
  %817 = bitcast double* %816 to <2 x double>*
  %818 = load <2 x double>, <2 x double>* %817, align 8, !tbaa !2
  %819 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %812
  %820 = bitcast double* %819 to <2 x double>*
  %821 = load <2 x double>, <2 x double>* %820, align 8, !tbaa !2
  %822 = getelementptr double, double* %819, i64 2
  %823 = bitcast double* %822 to <2 x double>*
  %824 = load <2 x double>, <2 x double>* %823, align 8, !tbaa !2
  %825 = fsub fast <2 x double> %815, %821
  %826 = fsub fast <2 x double> %818, %824
  %827 = fmul fast <2 x double> %825, %825
  %828 = fmul fast <2 x double> %826, %826
  %829 = fadd fast <2 x double> %827, %810
  %830 = fadd fast <2 x double> %828, %811
  %831 = add i64 %789, 8
  %832 = add i64 %792, -2
  %833 = icmp eq i64 %832, 0
  br i1 %833, label %834, label %788, !llvm.loop !40

; <label>:834:                                    ; preds = %788
  %835 = fadd fast <2 x double> %830, %829
  %836 = shufflevector <2 x double> %835, <2 x double> undef, <2 x i32> <i32 1, i32 undef>
  %837 = fadd fast <2 x double> %835, %836
  %838 = extractelement <2 x double> %837, i32 0
  %839 = icmp eq i64 %780, %783
  br i1 %839, label %855, label %840

; <label>:840:                                    ; preds = %834, %773
  %841 = phi i64 [ 1, %773 ], [ %784, %834 ]
  %842 = phi double [ 0.000000e+00, %773 ], [ %838, %834 ]
  br label %843

; <label>:843:                                    ; preds = %840, %843
  %844 = phi i64 [ %853, %843 ], [ %841, %840 ]
  %845 = phi double [ %852, %843 ], [ %842, %840 ]
  %846 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %844
  %847 = load double, double* %846, align 8, !tbaa !2
  %848 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %844
  %849 = load double, double* %848, align 8, !tbaa !2
  %850 = fsub fast double %847, %849
  %851 = fmul fast double %850, %850
  %852 = fadd fast double %851, %845
  %853 = add nuw nsw i64 %844, 1
  %854 = icmp sgt i64 %844, %774
  br i1 %854, label %855, label %843, !llvm.loop !41

; <label>:855:                                    ; preds = %843, %834, %772
  %856 = phi double [ 0.000000e+00, %772 ], [ %838, %834 ], [ %852, %843 ]
  %857 = tail call fast double @llvm.sqrt.f64(double %856)
  store double %857, double* %0, align 8, !tbaa !2
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.sqrt.f64(double) #4

declare void @timer_clear(i32) local_unnamed_addr #3

declare void @timer_start(i32) local_unnamed_addr #3

declare void @timer_stop(i32) local_unnamed_addr #3

declare double @timer_read(i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #4

declare void @c_print_results(i8*, i8 signext, i32, i32, i32, i32, i32, double, double, i8*, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable
declare double @llvm.pow.f64(double, double) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !13, !11}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !13, !11}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !13, !11}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !13, !11}
!22 = distinct !{!22, !11}
!23 = distinct !{!23, !13, !11}
!24 = distinct !{!24, !11}
!25 = distinct !{!25, !13, !11}
!26 = distinct !{!26, !13, !11}
!27 = distinct !{!27, !13, !11}
!28 = distinct !{!28, !13, !11}
!29 = distinct !{!29, !11}
!30 = distinct !{!30, !11}
!31 = distinct !{!31, !11}
!32 = distinct !{!32, !9}
!33 = distinct !{!33, !11}
!34 = distinct !{!34, !13, !11}
!35 = distinct !{!35, !11}
!36 = distinct !{!36, !13, !11}
!37 = distinct !{!37, !11}
!38 = distinct !{!38, !13, !11}
!39 = distinct !{!39, !9}
!40 = distinct !{!40, !11}
!41 = distinct !{!41, !13, !11}

///* Copyright (c) 2018 PaddlePaddle Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License. */

import Foundation

class PriorBoxParam<P: PrecisionType>: OpParam {
    typealias ParamPrecisionType = P
    required init(opDesc: OpDesc, inScope: Scope) throws {
        do {
            input = try PriorBoxParam.input(inputs: opDesc.inputs, from: inScope)
            output = try PriorBoxParam.getFirstTensor(key: "Boxes", map: opDesc.outputs, from: inScope)
            variances = try PriorBoxParam.getFirstTensor(key: "Variances", map: opDesc.outputs, from: inScope)
        } catch let error {
            throw error
        }
    }
    let input: Texture<P>
    var output: Texture<P>
    let variances: Texture<P>
}

class PriorBoxOp<P: PrecisionType>: Operator<PriorBoxKernel<P>, PriorBoxParam<P>>, Runable, Creator, InferShaperable{
    
    func inferShape() {
        para.output.dim = para.input.dim
    }
    
    typealias OpType = PriorBoxOp<P>
    func runImpl(device: MTLDevice, buffer: MTLCommandBuffer) throws {
        do {
            // try kernel.compute(commandBuffer: buffer, param: para)
        } catch let error {
            throw error
        }
    }
}


